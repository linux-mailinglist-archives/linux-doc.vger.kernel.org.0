Return-Path: <linux-doc+bounces-21525-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FFF93F710
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jul 2024 15:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3C891F220ED
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jul 2024 13:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A8014D29B;
	Mon, 29 Jul 2024 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DhKZrnP3"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F9614B06A
	for <linux-doc@vger.kernel.org>; Mon, 29 Jul 2024 13:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722261222; cv=none; b=du7EQuVnjG8RyNWfJW5CJe7k4uXBy/Sjt5DEhkn1SscXMT8HMeJc3hzHEypMEFkWS1pXmc0Zx+fLsmFEoXSSJN1ElFAwy8wdsHT0K+lI6OH4V3PD5mkOgnR+INE5yBwLsEq12s3Ss5njX2GKVxvLANBKgNTYX7j0b1zSGHw47wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722261222; c=relaxed/simple;
	bh=zevFigggh9gav77vOeUqQEZLN00S3klYyCxmhPrpO0k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WMBqcsm1ESG07uQuCXzf6N/kxd84hBijmdJNN0a8MikMBOGV/dRh3RqrBldCDCwwHfsgoybjy4ID/Gvn4MuuWm8fV5VLOP58KA06DKXoBEaQVzNnm62vwXYtZKmeJ05vjp4alNiia9S2wdHxxSykt08pTudyGV0WHAXUrDrSFuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DhKZrnP3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722261219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6yEq5CChoNdWngYsHC+lDcujFG99veLH/xTIPSOMsNE=;
	b=DhKZrnP3TxhUnvl5fLyd12xOmSxvn4skU5fsVqsQEV2PT8pCCWG/snxQSYP+VTDtLyRo90
	Gpjvpz1poJL9YSYjHOXtWRY8rEVO6jkk+BtlifOZvFf6yzfjiYvc+00vnClJDauvtOWjqT
	W+zda9g/c/ZUCPEZV6kUQdqLMPJVYxs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-YSRz27DANk6uusGpwU0INA-1; Mon, 29 Jul 2024 09:53:38 -0400
X-MC-Unique: YSRz27DANk6uusGpwU0INA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-36863648335so1523711f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jul 2024 06:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722261217; x=1722866017;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6yEq5CChoNdWngYsHC+lDcujFG99veLH/xTIPSOMsNE=;
        b=Ep9VEYTPig0XIP7BSrBr6M/zZaQ6aiMBtcCgWBZXLIQWLdiWA4YDWbrhJ3kgO9x6/9
         kcGl9uk6LRvtfr2imqRDW6p2XgoyK/LBRBZiNcsr4rnbQm6xXuIOM6ep5gE7WqBgQdtF
         LvRjxuHtxk67F5D1iJcuZhgRfNcjSKgXxfTasDz0IiKLUoHMw67qTj8LJrUKpLl7What
         Cx31UlNJQSa9NbDGnhG4jCXElxxABd2iQ4Vd0NvqHNJdtbiy/ENbjg1X+uC21+qoQaa4
         EHx/dI0EIucG+vyDSsLQNrQk8z8ecjhV15tSGKSIj0Z9ifIx87wZMZ5wiAudGqk1q9b1
         fF3g==
X-Forwarded-Encrypted: i=1; AJvYcCUScBJvFFWboHrudkQX5LlCkj56/yo3qeoqWCfiO74gZ89TrzYEe71Q1ixC8gtyhuw3dXzhq5i4baKbZVPokBFCffgduiQYCowr
X-Gm-Message-State: AOJu0YwsiTaa0zN+hGLe+cRYjZbAFdAvPG20XIhYvv+NBn26ggIqvkCa
	7K9t//A3MURux7K22lgh49Bt0Gpd3nvshR5eOz+4lflbhuV9ZzlzokUlhdCz1xhRioHH4o9xzsV
	MjUaCjB4OO93B+ooC8aNOiCZzBHsGOBL6vguUDjNe22s9uiSZoDsH87Nt5A==
X-Received: by 2002:a05:600c:444d:b0:426:65bf:5cc2 with SMTP id 5b1f17b1804b1-42811d83c38mr50666455e9.1.1722261216892;
        Mon, 29 Jul 2024 06:53:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ34nlwG6HFfNMqNvetJJ+pbG8/TxeOUBuPfISPhjduWTs2MRaELaUuF0Pc7fNro9Ocof+NQ==
X-Received: by 2002:a05:600c:444d:b0:426:65bf:5cc2 with SMTP id 5b1f17b1804b1-42811d83c38mr50666185e9.1.1722261216359;
        Mon, 29 Jul 2024 06:53:36 -0700 (PDT)
Received: from fedora (g2.ign.cz. [91.219.240.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280d13570bsm123111095e9.7.2024.07.29.06.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:53:36 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, linux-doc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, graf@amazon.de, dwmw2@infradead.org,
 pdurrant@amazon.com, mlevitsk@redhat.com, jgowans@amazon.com,
 corbet@lwn.net, decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 amoorthy@google.com
Subject: Re: [PATCH 01/18] KVM: x86: hyper-v: Introduce XMM output support
In-Reply-To: <D2RVJ6QCVNOU.XC0OC54QHI51@amazon.com>
References: <20240609154945.55332-1-nsaenz@amazon.com>
 <20240609154945.55332-2-nsaenz@amazon.com> <87tth0rku3.fsf@redhat.com>
 <D2RVJ6QCVNOU.XC0OC54QHI51@amazon.com>
Date: Mon, 29 Jul 2024 15:53:34 +0200
Message-ID: <878qxk5mox.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nicolas Saenz Julienne <nsaenz@amazon.com> writes:

> Hi Vitaly,
> Thanks for having a look at this.
>
> On Mon Jul 8, 2024 at 2:59 PM UTC, Vitaly Kuznetsov wrote:
>> Nicolas Saenz Julienne <nsaenz@amazon.com> writes:
>>
>> > Prepare infrastructure to be able to return data through the XMM
>> > registers when Hyper-V hypercalls are issues in fast mode. The XMM
>> > registers are exposed to user-space through KVM_EXIT_HYPERV_HCALL and
>> > restored on successful hypercall completion.
>> >
>> > Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
>> >
>> > ---
>> >
>> > There was some discussion in the RFC about whether growing 'struct
>> > kvm_hyperv_exit' is ABI breakage. IMO it isn't:
>> > - There is padding in 'struct kvm_run' that ensures that a bigger
>> >   'struct kvm_hyperv_exit' doesn't alter the offsets within that struct.
>> > - Adding a new field at the bottom of the 'hcall' field within the
>> >   'struct kvm_hyperv_exit' should be fine as well, as it doesn't alter
>> >   the offsets within that struct either.
>> > - Ultimately, previous updates to 'struct kvm_hyperv_exit's hint that
>> >   its size isn't part of the uABI. It already grew when syndbg was
>> >   introduced.
>>
>> Yes but SYNDBG exit comes with KVM_EXIT_HYPERV_SYNDBG. While I don't see
>> any immediate issues with the current approach, we may want to introduce
>> something like KVM_EXIT_HYPERV_HCALL_XMM: the userspace must be prepared
>> to handle this new information anyway and it is better to make
>> unprepared userspace fail with 'unknown exit' then to mishandle a
>> hypercall by ignoring XMM portion of the data.
>
> OK, I'll go that way. Just wanted to get a better understanding of why
> you felt it was necessary.
>

(sorry for delayed reply, I was on vacation)

I don't think it's an absolute must but it appears as a cleaner approach
to me. 

Imagine there's some userspace which handles KVM_EXIT_HYPERV_HCALL today
and we want to add XMM handling there. How would we know if xmm portion
of the data is actually filled by KVM or not? With your patch, we can of
course check for HV_X64_HYPERCALL_XMM_OUTPUT_AVAILABLE in
KVM_GET_SUPPORTED_HV_CPUID but this is not really straightforward, is
it? Checking the size is not good either. E.g. think about downstream
versions of KVM which may or may not have certain backports. In case we
(theoretically) do several additions to 'struct kvm_hyperv_exit', it
will quickly become a nightmare.

On the contrary, KVM_EXIT_HYPERV_HCALL_XMM (or just
KVM_EXIT_HYPERV_HCALL2) approach looks cleaner: once userspace sees it,
it knows that 'xmm' portion of the data can be relied upon.

-- 
Vitaly


