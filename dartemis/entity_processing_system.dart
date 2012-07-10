
/**
 * A typical entity system. Use this when you need to process entities possessing the
 * provided component types.
 *
 * @author Arni Arent
 *
 */
abstract class EntityProcessingSystem extends EntitySystem {

  /**
   * Create a new EntityProcessingSystem. It requires at least one component.
   * @param requiredType the required component type.
   * @param otherTypes other component types.
   */
  EntityProcessingSystem(Type requiredType, [List<Type> otherTypes]) : super(getMergedTypes(requiredType, otherTypes));

  /**
   * Process a entity this system is interested in.
   * @param e the entity to process.
   */
  abstract void _process(Entity e);


  void _processEntities(ImmutableBag<Entity> entities) {
    for (int i = 0, s = entities.size; s > i; i++) {
      _process(entities[i]);
    }
  }

  bool _checkProcessing() => true;

  Type get type() => const Type('EntityProcessingSystem');
}
