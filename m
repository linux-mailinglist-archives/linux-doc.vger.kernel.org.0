Return-Path: <linux-doc+bounces-3262-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EFE7FB3E6
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 09:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 959A81C20F3F
	for <lists+linux-doc@lfdr.de>; Tue, 28 Nov 2023 08:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C91818021;
	Tue, 28 Nov 2023 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cyV1YIaB"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D226495
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 00:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701159571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f+G3v9b7nc6doBY8tEy1SAvHLZUUfAmJX3ZXkH6zFBI=;
	b=cyV1YIaB4eOlT8LCQQO4XfvEtW2dN6gE631Bsj8wjJQSLYARB12/pf+w+XZ8VGJiIpyp86
	+vapFGLKbEG2E9YGBC/B2toqSXD5cPXQYBP/iwJyV4DKTDxSHjDN4I2EOJ0eOYclZkUpls
	HBuXd9fYF+2+yiyyHJCwmMC3iBrycnE=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-BzHQUHwSNiWM4S0hbElWPQ-1; Tue, 28 Nov 2023 03:19:29 -0500
X-MC-Unique: BzHQUHwSNiWM4S0hbElWPQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2c8749e1c2dso43773711fa.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 00:19:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701159567; x=1701764367;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f+G3v9b7nc6doBY8tEy1SAvHLZUUfAmJX3ZXkH6zFBI=;
        b=hqyU4DwSK1CSwqbEgbmif4vFSF23GR9cVDAAKAI2BJvA86Gn/maRWf5RH2chBkYsRr
         9MjjRsi9wOtvpLx+Y+oJ1vX2yVMqZgyjbr3lMGR8c6ZoGIA/dTC47Ll5pWHt5k52Xzl6
         c/9tr0W27gjJy+S7J2N1/HkXeaxI6oUF5eliGyEcqvsL3vE8OsfYWHiV2G6jJd3E1XfG
         afQ3pcGMkFecH171UbViLjkihhxlXkWFJ4FDZ2a3UlbxEHSfTZBn8lWRiNemQGnwfFVx
         qn/snyfcpKYe7kOG/2mp6Bt92eewkFiBqHhpf6K+iAtxB1kAkAjMCIvfKOwp11sTQ/9R
         R0XA==
X-Gm-Message-State: AOJu0YxbWcZgngamxkivTESvNb8L+6qgG9DQV2Mk3wevnyogoShTpT3r
	HIgL/IancPYY5G+WaM/8HRLotUMuUyqxCd8bdBYUif5dKU5P0AjRHkLTORvKQgA8MiTKky1KYXH
	OJ9/9l76LYr76LvpX0OP5
X-Received: by 2002:a2e:a41c:0:b0:2c5:12c4:5ff with SMTP id p28-20020a2ea41c000000b002c512c405ffmr9560487ljn.17.1701159567535;
        Tue, 28 Nov 2023 00:19:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8J321zKyNiQZhG7Be94fxSQDf1M4PnV1imORFlb0gJSJnp5IpNNTD4MOQzziOdmxEQkRtdw==
X-Received: by 2002:a2e:a41c:0:b0:2c5:12c4:5ff with SMTP id p28-20020a2ea41c000000b002c512c405ffmr9560473ljn.17.1701159567209;
        Tue, 28 Nov 2023 00:19:27 -0800 (PST)
Received: from starship ([77.137.131.4])
        by smtp.gmail.com with ESMTPSA id o36-20020a05600c512400b0040596352951sm17418065wms.5.2023.11.28.00.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:19:26 -0800 (PST)
Message-ID: <a19e0fd07f591dc768403544f92227b1121e068d.camel@redhat.com>
Subject: Re: [RFC 30/33] KVM: x86: hyper-v: Introduce
 KVM_REQ_HV_INJECT_INTERCEPT request
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>, Alexander Graf
 <graf@amazon.com>,  kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 anelkz@amazon.com,  dwmw@amazon.co.uk, jgowans@amazon.com, corbert@lwn.net,
 kys@microsoft.com,  haiyangz@microsoft.com, decui@microsoft.com,
 x86@kernel.org,  linux-doc@vger.kernel.org
Date: Tue, 28 Nov 2023 10:19:24 +0200
In-Reply-To: <CWTH00RO3SCI.31S210JQ8XP8J@amazon.com>
References: <20231108111806.92604-1-nsaenz@amazon.com>
	 <20231108111806.92604-31-nsaenz@amazon.com>
	 <c1e85d8a-7f59-4c75-ada1-8a80d79c2b4e@amazon.com>
	 <CWTH00RO3SCI.31S210JQ8XP8J@amazon.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2023-11-08 at 13:38 +0000, Nicolas Saenz Julienne wrote:
> On Wed Nov 8, 2023 at 12:45 PM UTC, Alexander Graf wrote:
> > On 08.11.23 12:18, Nicolas Saenz Julienne wrote:
> > > Introduce a new request type, KVM_REQ_HV_INJECT_INTERCEPT which allows
> > > injecting out-of-band Hyper-V secure intercepts. For now only memory
> > > access intercepts are supported. These are triggered when access a GPA
> > > protected by a higher VTL. The memory intercept metadata is filled based
> > > on the GPA provided through struct kvm_vcpu_hv_intercept_info, and
> > > injected into the guest through SynIC message.
> > > 
> > > Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> > 
> > IMHO memory protection violations should result in a user space exit. 
> 
> It already does, it's not very explicit from the patch itself, since the
> functionality was introduced in through the "KVM: guest_memfd() and
> per-page attributes" series [1].
> 
> See this snippet in patch #27:
> 
> +	if (kvm_hv_vsm_enabled(vcpu->kvm)) {
> +		if (kvm_hv_faultin_pfn(vcpu, fault)) {
> +			kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
> +			return -EFAULT;
> +		}
> +	}
> 
> Otherwise the doc in patch #33 also mentions this. :)
> 
> > User space can then validate what to do with the violation and if 
> > necessary inject an intercept.
> 
> I do agree that secure intercept injection should be moved into to
> user-space, and happen as a reaction to a user-space memory fault exit.
> I was unable to do so yet, since the intercepts require a level of
> introspection that is not yet available to QEMU. For example, providing
> the length of the instruction that caused the fault. I'll work on
> exposing the necessary information to user-space and move the whole
> intercept concept there.

All the missing information should be included in the new userspace VM exit payload.


Also I would like to share my knowledge of SYNIC and how to deal with it in userspace,
because you will have to send lots of SYNC messages from userspace if we go with
the suggested approach of doing it in the userspace.

- SYNIC has one message per channel, so there is no way to queue more than one
message in the same channel. Usually only channel 0 is used (but I haven't researched
this much).

- In-kernel STIMER emulation queues Synic messages, but it always does this in
the vCPU thread by processing the request 'KVM_REQ_HV_STIMER', and when userspace
wants to queue something with SYNIC it also does this on vCPU thread, this is how
races are avoided.

kvm_hv_process_stimers -> stimer_expiration -> stimer_send_msg(stimer);

If the delivery fails (that is if SYNIC slot already has a message pending there),
then the timer remains pending and the next KVM_REQ_HV_STIMER request will attempt to
deliver it again.
 
After the guest processes a SYNIC message, it erases it by overwriting its message type with 0,
and then the guest notifies the hypervisor about a free slot by either doing a write
to a special MSR (HV_X64_MSR_EOM) or by EOI'ing the APIC interrupt.

According to my observation windows uses the second approach (EOI),
which thankfully works even on AVIC because the Sync Interrupts happen to be level triggered,
and AVIC does intercept level triggered EOI.

Once intercepted the EOI event triggers a delivery of an another stimer message via the vCPU thread,
by raising another KVM_REQ_HV_STIMER request on it.

kvm_hv_notify_acked_sint -> stimer_mark_pending -> kvm_make_request(KVM_REQ_HV_STIMER, vcpu);


Now if the userspace faces already full SYNIC slot, it has to wait, and I don't know if
it can be notified of an EOI or it busy waits somehow.

Note that Qemu's VMBUS/SYNC implementation was never tested in production IMHO, it was once implemented
and is only used currently by a few unit tests.

It might make sense to add userspace SYNIC message queuing to the kernel,
so that userspace could queue as many messages as it wants and let the kernel
copy the first message in the queue to the actual SYNIC slot, every time
it becomes free.


Final note on SYNIC is that qemu's synic code actually installs an overlay
page over sync slots area and writes to it when it queues a message, 
but the in-kernel stimer code just writes to the GPA regardless
if there is an overlay memslot or not.

Another benefit of a proper way of queuing SYNIC messages from the userspace,
is that it might enable the kernel's STIMER to queue the SYNIC message
directly from the timer interrupt routine, which will remove about 1000 vmexits per second that
are caused by KVM_REQ_HV_STIMER on vCPU0, even when posted timer interrupts are used.

I can implement this if you think that this makes sense.

Those are my 0.2 cents.

Best regards,
	Maxim Levitsky


> 
> Nicolas
> 
> [1] https://lore.kernel.org/lkml/20231105163040.14904-1-pbonzini@redhat.com/.
> 



