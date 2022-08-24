Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 277D759EF97
	for <lists+linux-doc@lfdr.de>; Wed, 24 Aug 2022 01:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbiHWXTO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Aug 2022 19:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbiHWXTM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Aug 2022 19:19:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF226C138
        for <linux-doc@vger.kernel.org>; Tue, 23 Aug 2022 16:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661296750;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ejd2XqlPIsLaN92xua+1YOCeIUPLipE6EMcANIURHpk=;
        b=GaRBxrW7Se08u39DZdK8ByMaOQVXRtkTe70bkf5M1TxrF50rczUQPAdx6a8ZqW8djylJfA
        wFsV+46uqnkzAeYbntY+/JkrCF/y+F6aAdelTM7lD0uekIla1OCSlI6lXZdq+0/wfMtQfA
        eSg2KUOIKmjatZ/c4MC2efo3nl9AQxQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-465-TSzoHU1lNeGG22SjhgOdBA-1; Tue, 23 Aug 2022 19:19:09 -0400
X-MC-Unique: TSzoHU1lNeGG22SjhgOdBA-1
Received: by mail-qk1-f200.google.com with SMTP id l15-20020a05620a28cf00b006b46997c070so13501807qkp.20
        for <linux-doc@vger.kernel.org>; Tue, 23 Aug 2022 16:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Ejd2XqlPIsLaN92xua+1YOCeIUPLipE6EMcANIURHpk=;
        b=4kQIA0xZveLpFOX+taQhxxIlGafnH4iR3337T03S4qiQlbn2YBU8w+B/+Zep9ywzgd
         YGlZ/YA7NQ4+eyFmx0Jjw1elcci3lm6WmwsJBpXLOCRHzg1HNfRfOzIHrokFY9hyzIQx
         vRJHx5s4f7S82d6tu9Rxhs5enilTsFlm9Tmg4Umt10MbC2EK7rLTfxVMYiMlubCM+azL
         cLY4cEn+U/3la9Il7KzQuiDJ4935Ap8ujtyL4Nj/8ugwPmZcnuDw1yew7LWugiFDY32l
         3sLs6o1rA1h33nSgSDvmLxhBA+nyHZKIE8pJM/3TUJ156E2N+727q4khMOPsmfpgsZkT
         vIrw==
X-Gm-Message-State: ACgBeo3LeWDYNGwtlrhvMriyWlsq7ApjcH9BzJrFiLWfxuNypzfcQUeI
        ir+xxZoWI8eqRqjdE0QDWfIjsOavmd9/RrLo6YuHcn0NEiWlUjhdD4ApafXngKx4rJ83zXK2rLX
        bo3YxhJwYR3PVIkRKzYmZ
X-Received: by 2002:a37:b243:0:b0:6bc:3d04:623f with SMTP id b64-20020a37b243000000b006bc3d04623fmr4888015qkf.672.1661296748660;
        Tue, 23 Aug 2022 16:19:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR68qAn5UZduxSvc7YFRPNkyTTJD1EBYt7TKsqkGY0aznLoNst64fUxKKLOOcY75RG0ZX5cbHQ==
X-Received: by 2002:a37:b243:0:b0:6bc:3d04:623f with SMTP id b64-20020a37b243000000b006bc3d04623fmr4887979qkf.672.1661296748284;
        Tue, 23 Aug 2022 16:19:08 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id dm33-20020a05620a1d6100b006b5f8f32a8fsm15149348qkb.114.2022.08.23.16.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 16:19:07 -0700 (PDT)
Date:   Tue, 23 Aug 2022 19:19:04 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Gavin Shan <gshan@redhat.com>, kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, pbonzini@redhat.com,
        corbet@lwn.net, james.morse@arm.com, alexandru.elisei@arm.com,
        suzuki.poulose@arm.com, oliver.upton@linux.dev,
        catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
        seanjc@google.com, dmatlack@google.com, bgardon@google.com,
        ricarkol@google.com, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH v1 1/5] KVM: arm64: Enable ring-based dirty memory
 tracking
Message-ID: <YwVgaGp3HOGzC8k2@xz-m1.local>
References: <20220819005601.198436-1-gshan@redhat.com>
 <20220819005601.198436-2-gshan@redhat.com>
 <87lerkwtm5.wl-maz@kernel.org>
 <41fb5a1f-29a9-e6bb-9fab-4c83a2a8fce5@redhat.com>
 <87fshovtu0.wl-maz@kernel.org>
 <171d0159-4698-354b-8b2f-49d920d03b1b@redhat.com>
 <YwTc++Lz6lh3aR4F@xz-m1.local>
 <87bksawz0w.wl-maz@kernel.org>
 <YwVEoM1pj2MPCELp@xz-m1.local>
 <878rnewpaw.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878rnewpaw.wl-maz@kernel.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 23, 2022 at 11:47:03PM +0100, Marc Zyngier wrote:
> On Tue, 23 Aug 2022 22:20:32 +0100,
> Peter Xu <peterx@redhat.com> wrote:
> > 
> > On Tue, Aug 23, 2022 at 08:17:03PM +0100, Marc Zyngier wrote:
> > > I don't think we really need this check on the hot path. All we need
> > > is to make the request sticky until userspace gets their act together
> > > and consumes elements in the ring. Something like:
> > > 
> > > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > > index 986cee6fbc7f..e8ed5e1af159 100644
> > > --- a/arch/arm64/kvm/arm.c
> > > +++ b/arch/arm64/kvm/arm.c
> > > @@ -747,6 +747,14 @@ static int check_vcpu_requests(struct kvm_vcpu *vcpu)
> > >  
> > >  		if (kvm_check_request(KVM_REQ_SUSPEND, vcpu))
> > >  			return kvm_vcpu_suspend(vcpu);
> > > +
> > > +		if (kvm_check_request(KVM_REQ_RING_SOFT_FULL, vcpu) &&
> > > +		    kvm_dirty_ring_soft_full(vcpu)) {
> > > +			kvm_make_request(KVM_REQ_RING_SOFT_FULL, vcpu);
> > > +			vcpu->run->exit_reason = KVM_EXIT_DIRTY_RING_FULL;
> > > +			trace_kvm_dirty_ring_exit(vcpu);
> > > +			return 0;
> > > +		}
> > >  	}
> > >  
> > >  	return 1;
> > 
> > Right, this seems working.  We can also use kvm_test_request() here.
> > 
> > > 
> > > 
> > > However, I'm a bit concerned by the reset side of things. It iterates
> > > over the vcpus and expects the view of each ring to be consistent,
> > > even if userspace is hacking at it from another CPU. For example, I
> > > can't see what guarantees that the kernel observes the writes from
> > > userspace in the order they are being performed (the documentation
> > > provides no requirements other than "it must collect the dirty GFNs in
> > > sequence", which doesn't mean much from an ordering perspective).
> > > 
> > > I can see that working on a strongly ordered architecture, but on
> > > something as relaxed as ARM, the CPUs may^Wwill aggressively reorder
> > > stuff that isn't explicitly ordered. I have the feeling that a CAS
> > > operation on both sides would be enough, but someone who actually
> > > understands how this works should have a look...
> > 
> > I definitely don't think I 100% understand all the ordering things since
> > they're complicated.. but my understanding is that the reset procedure
> > didn't need memory barrier (unlike pushing, where we have explicit wmb),
> > because we assumed the userapp is not hostile so logically it should only
> > modify the flags which is a 32bit field, assuming atomicity guaranteed.
> 
> Atomicity doesn't guarantee ordering, unfortunately.

Right, sorry to be misleading.  The "atomicity" part I was trying to say
the kernel will always see consistent update on the fields.

The ordering should also be guaranteed, because things must happen with
below sequence:

  (1) kernel publish dirty GFN data (slot, offset)
  (2) kernel publish dirty GFN flag (set to DIRTY)
  (3) user sees DIRTY, collects (slots, offset)
  (4) user sets it to RESET
  (5) kernel reads RESET

So the ordering of single-entry is guaranteed in that when (5) happens it
must be after stablized (1+2).

> Take the
> following example: CPU0 is changing a bunch of flags for GFNs A, B, C,
> D that exist in the ring in that order, and CPU1 performs an ioctl to
> reset the page state.
> 
> CPU0:
>     write_flag(A, KVM_DIRTY_GFN_F_RESET)
>     write_flag(B, KVM_DIRTY_GFN_F_RESET)
>     write_flag(C, KVM_DIRTY_GFN_F_RESET)
>     write_flag(D, KVM_DIRTY_GFN_F_RESET)
>     [...]
> 
> CPU1:
>    ioctl(KVM_RESET_DIRTY_RINGS)
> 
> Since CPU0 writes do not have any ordering, CPU1 can observe the
> writes in a sequence that have nothing to do with program order, and
> could for example observe that GFN A and D have been reset, but not B
> and C. This in turn breaks the logic in the reset code (B, C, and D
> don't get reset), despite userspace having followed the spec to the
> letter. If each was a store-release (which is the case on x86), it
> wouldn't be a problem, but nothing calls it in the documentation.
> 
> Maybe that's not a big deal if it is expected that each CPU will issue
> a KVM_RESET_DIRTY_RINGS itself, ensuring that it observe its own
> writes. But expecting this to work across CPUs without any barrier is
> wishful thinking.

I see what you meant...

Firstly I'm actually curious whether that'll really happen if the gfns are
collected in something like a for loop:

  for(i = 0; i < N; i++)
    collect_dirty_gfn(ring, i);

Because since all the gfps to be read will depend on variable "i", IIUC no
reordering should happen, but I'm not really sure, so more of a pure
question.

Besides, the other thing to mention is that I think it is fine the RESET
ioctl didn't recycle all the gfns got set to reset state.  Taking above
example of GFNs A-D, if when reaching the RESET ioctl only A & D's flags
are updated, the ioctl will recycle gfn A but stop at gfn B assuming B-D
are not reset.  But IMHO it's okay because it means we reset partial of the
gfns not all of them, and it's safe to do so.  It means the next ring full
event can come earlier because we recycled less, but that's functionally
safe to me.

> 
> > IIRC we used to discuss similar questions on "what if the user is hostile
> > and wants to hack the process by messing up with the ring", and our
> > conclusion was as long as the process wouldn't mess up anything outside
> > itself it should be okay. E.g. It should not be able to either cause the
> > host to misfunction, or trigger kernel warnings in dmesg, etc..
> 
> I'm not even discussing safety here. I'm purely discussing the
> interactions between userspace and kernel based on the documentation
> and the existing kernel code.

I see.  Please let me know if above makes sense.

Thanks!

-- 
Peter Xu

