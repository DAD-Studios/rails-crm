import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { patch } from '@rails/request.js'

export default class extends Controller {
  static targets = ["column"]

  connect() {
    this.columnTargets.forEach((column) => {
      new Sortable(column.querySelector('.space-y-4'), {
        group: 'kanban',
        animation: 150,
        onEnd: this.end.bind(this)
      })
    })
  }

  end(event) {
    const agentId = event.item.dataset.agentId
    const newStatus = event.to.closest('[data-status]').dataset.status

    const url = `/agents/${agentId}/update_status`
    const body = { status: newStatus }

    patch(url, { body: JSON.stringify(body), responseKind: 'json' })
  }
}
