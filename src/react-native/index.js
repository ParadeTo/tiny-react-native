import Bridge from './Bridge'
import Reconciler from 'react-reconciler'

const HostConfig = {
  // 通过 FiberNode 创建 instance，会保存在 FiberNode 的 stateNode 属性上
  // 参考 http://www.paradeto.com/react-render/
  createInstance: function (
    type,
    newProps,
    rootContainerInstance,
    currentHostContext,
    workInProgress
  ) {
    return Bridge.createElement(type, newProps)
  },
  /* 操作子组件 */
  appendInitialChild(parent, child) {
    Bridge.appendChild(parent, child)
  },
  appendChildToContainer(parent, child) {
    Bridge.appendChild(parent, child)
  },
  appendChild: function (parent, child) {
    Bridge.appendChild(parent, child)
  },
  insertBefore(parent, child, beforeChild) {
    parent.insertBefore(child, beforeChild)
  },
  removeChild(parent, child) {
    parent.removeChild(child)
  },

  /* FiberNode 的属性发生变化时会调用该方法 */
  commitUpdate: function (
    instance,
    updatePayload,
    type,
    oldProps,
    newProps,
    finishedWork
  ) {
    Bridge.update(instance, newProps)
    // instance.update(newProps)
  },

  resetAfterCommit: function (rootContainerInstance) {},

  getRootHostContext(nextRootInstance) {
    const rootContext = {}
    return rootContext
  },
  getChildHostContext: function (parentContext, fiberType, rootInstance) {
    const context = {}
    return context
  },
  prepareForCommit: function (rootContainerInstance) {
    return null
  },
  prepareUpdate(
    instance,
    type,
    oldProps,
    newProps,
    rootContainerInstance,
    currentHostContext
  ) {
    return {}
  },
  supportsMutation: true,

  // 暂时不需要的接口
  finalizeInitialChildren: function () {},
  appendAllChildren(...args) {},
  commitTextUpdate: function (textInstance, oldText, newText) {},

  removeChildFromContainer(container, child) {},
  commitMount: (domElement, type, newProps, fiberNode) => {},
  clearContainer(...args) {},
  createTextInstance: function (
    newText,
    rootContainerInstance,
    currentHostContext,
    workInProgress
  ) {},
  shouldSetTextContent: function (...args) {},
}

const reconcilerInstance = Reconciler(HostConfig)

const CanvasRenderer = {
  render(element, renderDom, callback) {
    const root = Bridge.createRoot(renderDom)
    const isAsync = false // Disables async rendering
    const container = reconcilerInstance.createContainer(root, isAsync) // Creates root fiber node.
    const parentComponent = null // Since there is no parent (since this is the root fiber). We set parentComponent to null.

    reconcilerInstance.updateContainer(
      element,
      container,
      parentComponent,
      callback
    ) // Start reconcilation and render the result
  },
}

export default CanvasRenderer
export {default as View} from './View'
