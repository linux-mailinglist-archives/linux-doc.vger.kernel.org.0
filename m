Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B51062EA21
	for <lists+linux-doc@lfdr.de>; Fri, 18 Nov 2022 01:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233315AbiKRAUg (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Nov 2022 19:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235099AbiKRAUf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Nov 2022 19:20:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E21B665E76;
        Thu, 17 Nov 2022 16:20:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7DEA862257;
        Fri, 18 Nov 2022 00:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DD1C433C1;
        Fri, 18 Nov 2022 00:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668730832;
        bh=UPKFz2DsiakqWhGmlH6ehaMqM4wm6M3vd2T7GaE1SQw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=imroKEniBTTIqxq1/mcUCDjw0gXXBCz/5lchVAcVG5jEO3ZeNbN2jlyHR7W2fLaPq
         WsKOtqPfrLtoxMNvxsBVu0rUhlnsnlrAGbyaILTeLAuRa0I2QJqysQbak1S8I2EkS+
         SLMy4MKsd/r2wmkrT9XiSrRjf96AaDtD6zD0OlQCdaWnSP9LViEUcpuBmVWxMJHdmy
         m7rESH7yae05V8s5QOYoMy5IiOIcMESXCWdzXbHOeof6TwOv715rmmPk/YXN2d59Pv
         +QE4ZIxIJnjN9ifVukmDw7c/VfTTija0hA6eDgt92nbUmt/LKBVFBdHMi++HjOhLGX
         wELms2dbIY27w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1ovp7O-006roN-TM;
        Fri, 18 Nov 2022 00:20:31 +0000
Date:   Fri, 18 Nov 2022 00:20:30 +0000
Message-ID: <86r0y1nmep.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Usama Arif <usama.arif@bytedance.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, linux@armlinux.org.uk,
        yezengruan@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        steven.price@arm.com, mark.rutland@arm.com, bagasdotme@gmail.com,
        fam.zheng@bytedance.com, liangma@liangbit.com,
        punit.agrawal@bytedance.com
Subject: Re: [External] Re: [v2 0/6] KVM: arm64: implement vcpu_is_preempted check
In-Reply-To: <180b91af-a2aa-2cfd-eb7f-b2825c4e3dbe@bytedance.com>
References: <20221104062105.4119003-1-usama.arif@bytedance.com>
        <87k048f3cm.wl-maz@kernel.org>
        <180b91af-a2aa-2cfd-eb7f-b2825c4e3dbe@bytedance.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: usama.arif@bytedance.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org, linux@armlinux.org.uk, yezengruan@huawei.com, catalin.marinas@arm.com, will@kernel.org, steven.price@arm.com, mark.rutland@arm.com, bagasdotme@gmail.com, fam.zheng@bytedance.com, liangma@liangbit.com, punit.agrawal@bytedance.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 07 Nov 2022 12:00:44 +0000,
Usama Arif <usama.arif@bytedance.com> wrote:
> 
> 
> 
> On 06/11/2022 16:35, Marc Zyngier wrote:
> > On Fri, 04 Nov 2022 06:20:59 +0000,
> > Usama Arif <usama.arif@bytedance.com> wrote:
> >> 
> >> This patchset adds support for vcpu_is_preempted in arm64, which
> >> allows the guest to check if a vcpu was scheduled out, which is
> >> useful to know incase it was holding a lock. vcpu_is_preempted can
> >> be used to improve performance in locking (see owner_on_cpu usage in
> >> mutex_spin_on_owner, mutex_can_spin_on_owner, rtmutex_spin_on_owner
> >> and osq_lock) and scheduling (see available_idle_cpu which is used
> >> in several places in kernel/sched/fair.c for e.g. in wake_affine to
> >> determine which CPU can run soonest):
> > 
> > [...]
> > 
> >> pvcy shows a smaller overall improvement (50%) compared to
> >> vcpu_is_preempted (277%).  Host side flamegraph analysis shows that
> >> ~60% of the host time when using pvcy is spent in kvm_handle_wfx,
> >> compared with ~1.5% when using vcpu_is_preempted, hence
> >> vcpu_is_preempted shows a larger improvement.
> > 
> > And have you worked out *why* we spend so much time handling WFE?
> > 
> > 	M.
> 
> Its from the following change in pvcy patchset:
> 
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index e778eefcf214..915644816a85 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -118,7 +118,12 @@ static int kvm_handle_wfx(struct kvm_vcpu *vcpu)
>         }
> 
>         if (esr & ESR_ELx_WFx_ISS_WFE) {
> -               kvm_vcpu_on_spin(vcpu, vcpu_mode_priv(vcpu));
> +               int state;
> +               while ((state = kvm_pvcy_check_state(vcpu)) == 0)
> +                       schedule();
> +
> +               if (state == -1)
> +                       kvm_vcpu_on_spin(vcpu, vcpu_mode_priv(vcpu));
>         } else {
>                 if (esr & ESR_ELx_WFx_ISS_WFxT)
>                         vcpu_set_flag(vcpu, IN_WFIT);
> 
> 
> If my understanding is correct of the pvcy changes, whenever pvcy
> returns an unchanged vcpu state, we would schedule to another
> vcpu. And its the constant scheduling where the time is spent. I guess
> the affects are much higher when the lock contention is very
> high. This can be seem from the pvcy host side flamegraph as well with
> (~67% of the time spent in the schedule() call in kvm_handle_wfx), For
> reference, I have put the graph at:
> https://uarif1.github.io/pvlock/perf_host_pvcy_nmi.svg

The real issue here is that we don't try to pick the right vcpu to
run, and strictly rely on schedule() to eventually pick something that
can run.

An interesting to do would be to try and fit the directed yield
mechanism there. It would be a lot more interesting than the one-off
vcpu_is_preempted hack, as it gives us a low-level primitive on which
to construct things (pvcy is effectively a mwait-like primitive).

	M.

-- 
Without deviation from the norm, progress is not possible.
