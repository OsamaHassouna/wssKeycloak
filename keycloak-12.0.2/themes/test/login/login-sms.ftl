<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
	<#if section = "header">
		${msg("smsAuthTitle",realm.displayName)}
	<#elseif section = "form">

	
    <div class="card d-flex align-items-center p-40 w-550">
        <form id="kc-sms-code-login-form" action="${url.loginAction}" method="post">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="form-group mb-30">
                        <div class="logo text-center">
                            <img  src="${url.resourcesPath}/img/logo.png" alt="logo">
                        </div>
                    </div>
                </div>

                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="form-group text-center mb-30">
                        <h4 class="text-primary font-size-h5 font-weight-normal">${msg("verifiedCode")}</h4>
                        <p class="text-muted font-size-sm">
							${msg("smsMsg")}
						</p>
                    </div>
                </div>
                
                <div class="col-sm-12 col-md-10 col-lg-10 col-md-offset-1">
                    <div class="form-group mb-20 d-flex justify-content-around">
						<#--  <input type="number" class="form-control sms-code" placeholder="0" autofocus/>
						<input type="number" class="form-control sms-code" placeholder="0"/>
						<input type="number" class="form-control sms-code" placeholder="0"/>
						<input type="number" class="form-control sms-code" placeholder="0"/>  -->
						<input type="number"id="code" name="code" class="form-control sms-code" placeholder="0" autofocus/>
                    </div>
                </div>

				<div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="form-group text-center mb-30">
                        <p class="text-dark font-size-sm" id="codeCounter">
							Resend verified code after
							<span class="text-primary" id="counter"></span>
						</p>
                        <a href="" class="text-primary font-size-sm text-decoration-underline" id="resendCodeLink">
							Resend verified code
						</a>
                    </div>
                </div>

                <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="form-group m-0">
                        <button type="submit" class="btn btn-primary full-width" value="${msg('doSubmit')}">
							${msg('login')}
						</button>
                    </div>
                </div>

				<#--  <div class="col-sm-12 col-md-12 col-lg-12">
                    <div class="form-group text-center m-0">
                        <span>Back to <a href="${url.loginUrl}" class="text-primary text-decoration-underline">${kcSanitize(msg("login"))?no_esc}</a></span>
                    </div>
                </div>  -->

            </div>
        </form>
    </div>
    


		<#--  <form id="kc-sms-code-login-form" action="${url.loginAction}" method="post">
			<div class="${properties.kcFormGroupClass!}">
				<div class="${properties.kcLabelWrapperClass!}">
					<label for="code" class="${properties.kcLabelClass!}">${msg("smsAuthLabel")}</label>
				</div>
				<div class="${properties.kcInputWrapperClass!}">
					<input type="text" id="code" name="code" class="${properties.kcInputClass!}" autofocus/>
				</div>
			</div>
			<div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
				<div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
					<div class="${properties.kcFormOptionsWrapperClass!}">
						<span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
					</div>
				</div>

				<div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
					<input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg('doSubmit')}"/>
				</div>
			</div>
		</form>  -->
	<#elseif section = "info" >
		${msg("smsAuthInstruction")}
	</#if>
</@layout.registrationLayout>

<script>

	window.onload = function() {
		var counter = document.querySelector('#counter'),
			timer = new CountDownTimer(300);

		timer.onTick(format).start();
		function format(minutes, seconds) {
			minutes = minutes < 10 ? "0" + minutes : minutes;
			seconds = seconds < 10 ? "0" + seconds : seconds;
			counter.textContent = minutes + ':' + seconds;
		}

	};

	function CountDownTimer(duration, granularity) {
		this.duration = duration;
		this.granularity = granularity || 1000;
		this.tickFtns = [];
		this.running = false;
		}

		var rscl = document.getElementById("resendCodeLink");
		var cc = document.getElementById("codeCounter");

		CountDownTimer.prototype.start = function() {
		if (this.running) {
			return;
		}
		this.running = true;
		var start = Date.now(),
			that = this,
			diff, obj;

		(function timer() {
			diff = that.duration - (((Date.now() - start) / 1000) | 0);

			if (diff > 0) {
			rscl.style.display = "none";
			setTimeout(timer, that.granularity);
			} else {
			diff = 0;
			that.running = false;
			console.log('counter finished')
			rscl.style.display = "inline";
			cc.style.display = "none";
			}

			obj = CountDownTimer.parse(diff);
			that.tickFtns.forEach(function(ftn) {
			ftn.call(this, obj.minutes, obj.seconds);
			}, that);
		}());
		};

		CountDownTimer.prototype.onTick = function(ftn) {
		if (typeof ftn === 'function') {
			this.tickFtns.push(ftn);
		}
		return this;
		};

		CountDownTimer.prototype.expired = function() {
		return !this.running;
		};

		CountDownTimer.parse = function(seconds) {
		return {
			'minutes': (seconds / 60) | 0,
			'seconds': (seconds % 60) | 0
		};
	};
</script>