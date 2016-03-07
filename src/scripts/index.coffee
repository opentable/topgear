init = ->
	long_pipe()

long_pipe = ->
	$lp = $('#long-pipe')
	$lp.on 'impress:stepenter', ->
		$('.arrow-left', $lp).animate { opacity: 1 }, ->
			$('.left-box', $lp).animate { opacity: 1}, 3000, ->
				$('.arrow-right', $lp).animate { opacity: 1}, ->
					$('.right-box', $lp).animate { opacity: 1}, 3000, ->

						$('.you-are-here', $lp).animate { opacity: 1 }
						$('.you-are-here-msg', $lp).animate { opacity: 1 }


$(document).ready init