package org.springframework.roo.support.osgi;

import org.osgi.framework.BundleContext;
import org.osgi.framework.InvalidSyntaxException;
import org.osgi.framework.ServiceReference;
import org.springframework.roo.support.logging.HandlerUtils;

import java.util.HashMap;
import java.util.Map;
import java.util.logging.Logger;

/**
 * = _ServiceInstaceManager_
 *
 * Utility class which handles OSGi service request of a Component.
 *
 * This caches previous request.
 *
 * *Warning*: This class requires to set {@link BundleContext} thru calling {@link #activate(BundleContext)}
 * before return service instances.
 *
 * @author Jose Manuel Vivó
 * @since 2.0.0
 */
public class ServiceInstaceManager {

  protected final static Logger LOGGER = HandlerUtils.getLogger(ServiceInstaceManager.class);

  @SuppressWarnings("rawtypes")
  private Map<Class, Object> instances = new HashMap<Class, Object>(8);

  private BundleContext context;

  public ServiceInstaceManager() {}

  public void activate(BundleContext context) {
    this.context = context;
  }

  @SuppressWarnings({"unchecked"})
  public <SERVICE> SERVICE getServiceInstance(Object requester, Class<SERVICE> serviceClass) {
    SERVICE service = (SERVICE) instances.get(serviceClass);
    if (service == null) {
      if (context == null) {
        throw new IllegalStateException("Tried to get service '" + serviceClass.getName()
            + "' without activation in " + requester.getClass().getCanonicalName());
      }
      try {
        ServiceReference<?>[] references =
            context.getAllServiceReferences(serviceClass.getName(), null);

        if (references == null) {
          LOGGER.warning("Cannot load " + serviceClass.getName() + " on "
              + requester.getClass().getName() + ": getAllServiceReferences returns 'null'");
          return null;
        }

        if (references.length >= 1) {
          // XXX should store reference to support dereference instances?
          service = (SERVICE) context.getService(references[0]);
          if (references.length > 1) {
            LOGGER.warning("Found multiples references of " + serviceClass.getName() + " on "
                + requester.getClass().getName() + ": using "
                + service.getClass().getCanonicalName());
          }
        }
      } catch (InvalidSyntaxException e) {
        LOGGER.warning("Cannot load " + serviceClass.getName() + " on "
            + requester.getClass().getName() + ":".concat(e.toString()));
        return null;
      }
      if (service != null) {
        instances.put(serviceClass, service);
      }
    }
    return service;
  }

  public void deactivate() {
    // XXX should dereference instances?
    instances.clear();
  }
}
