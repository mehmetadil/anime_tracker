import {Controller} from 'stimulus'
import {debounce} from 'lodash-es'

export default class extends Controller {
    static targets = ["q", "searchResult"]

    initialize() {
        this.search = debounce(this.search, 500).bind(this)
    }

    search() {
        if (this.hasSearchResultTarget) {
            this.searchResultTargets.forEach((el, i) => {
                el.innerHTML = ''
            })
        }
        let query_param = '?q=' + this.qTarget.value
        fetch(this.data.get("url") + query_param, {
            // headers: {
            //     'Content-Type': 'application/json',
            //     'Accept': 'application/json'
            // }
        })
            .then(response => response.text())
            .then(result => {
                this.element.innerHTML += result
            })

    }
}
