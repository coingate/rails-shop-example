# Garber-Irish DOM-ready page execution
# http://viget.com/inspire/extending-paul-irishs-comprehensive-dom-ready-execution

window.execPageSpecific = (appName = 'App') ->
  body              = document.body
  controller_path   = body.getAttribute('data-controller')
  action            = body.getAttribute('data-action')

  if controller_path && action
    if controller_path.match('/')
      pathArr     = controller_path.split('/')
      namespace   = pathArr[0]
      controller  = pathArr[1]
    else
      namespace = ''
      controller = controller_path

    className = _.str.classify("#{namespace}_#{controller}_#{action}")

    if App.Pages[className]
      klass = eval("new #{appName}.Pages.#{className}")
      klass.init() if klass.init