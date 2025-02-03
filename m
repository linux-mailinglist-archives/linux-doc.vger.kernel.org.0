Return-Path: <linux-doc+bounces-36694-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1DDA263F7
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 20:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75F981664DB
	for <lists+linux-doc@lfdr.de>; Mon,  3 Feb 2025 19:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1B81DB377;
	Mon,  3 Feb 2025 19:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tq3jmft+"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BAD25A623
	for <linux-doc@vger.kernel.org>; Mon,  3 Feb 2025 19:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738612000; cv=none; b=c42egxgk2RvQtnzI8D849emEhN7iscgMmeVM3mw+iRIU+5oDnVDGN7qb37BmVfXtuPz4HYsIAgb224jaIYbk3jw0OOk75uzACGKg3VoHffmlVoqLlqz7W+Ne5OZe607riXtwxhGWES4hkNAaAhnLrRNEaFCVlXej6dnBoHsYymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738612000; c=relaxed/simple;
	bh=09whj4uZGPY+MU0n+/5yUTtg1hWaTb1nkD/DeIxUkCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNlnJ4hYJrdOc5zv2U1IRbU8sX380MgJPNWdVhEa2O6dZ5E82BYvvZ8ERt3N7Ig8m/69lJB/JBM03rM8LJNvcWri70wF0PpoCa3QjMVKPp0wz90RRLFeiKU1+VPf27ZJvcSDmwPO1K9lpT+V98Bg7Q8a9ncygWzRetG/z3/FiGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tq3jmft+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738611997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OXEsTHoAIxPyeu+L6p4C4IoY0yLlvxYneWJOKrJchu0=;
	b=Tq3jmft+uMzYDuJmj6FvetgMoiczMuc643bxBJgEdH3W9pN4r1QdTtQTLkMI8CbvmfzK3e
	2WltnDHD1k6v1xj7ClzFMCDo2uby5FcG8MgbcSQKTdNONnb0uPJHRDyYbv5Qa/63NPan2J
	W61IbEJ9osrSOU6wyp22td/kdCApV0c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-HyWN5ZdFN6qZwyPC01tvnw-1; Mon, 03 Feb 2025 14:46:36 -0500
X-MC-Unique: HyWN5ZdFN6qZwyPC01tvnw-1
X-Mimecast-MFC-AGG-ID: HyWN5ZdFN6qZwyPC01tvnw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43626224274so25041665e9.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2025 11:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611995; x=1739216795;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXEsTHoAIxPyeu+L6p4C4IoY0yLlvxYneWJOKrJchu0=;
        b=F/7/MHGmWWuTG1J55pu1h+sptzA4/NfpytBbx8GwpuNTs/QdU0dl/KBkOrF5AoUtae
         vNwaYW5aM0wDw3Z5Ub2vNpWel9l6Wv0R86T60K1Mi3xG8qlAfxVjhoFRMbaMCoAsIwPK
         aYKMFJj77VTPPZ8AM+eh3lMQM2Jhkz4UM0XChOJ0BiBnMhEhQpSfI5yJO2poEm6zo0XO
         2UR2SFrHtmlioTGNp8n/ytAi2bkSjr5lTWMwwEjWamWugfXPU70CZo/0gM0ulG56Mltv
         nsinAFNIcnk5/nPVZd4RTvnBFkIwAIMbwCKYxKGbs/RDJT3QWpbcYDxOJW/z3OqpC+Ax
         aikA==
X-Forwarded-Encrypted: i=1; AJvYcCVtst2sXRD1OqlmMCI014N5DFAAu5XWKz10LYoffgw8VoER5BU+/2lVBJL2kuCgzD2rGG+O7gorZnw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw12qwzSjuszr3gFIcP85g+3xMlIIMtjkX89Xs2CBfSpnA4VVPh
	RocamIVEwLcppWCblmJut5bBVvyUomrlUv7Pa30t9sCTCvOTpc2Y3EtFIEI27gf8x6fNxg/ewq2
	Y+V+47plrR4hJ9JJDTI9U2lorQINSGr3dcy5zohQB7ACNhjRvYWXY+ldyvg==
X-Gm-Gg: ASbGnctOcLsMS0TWdqMMjTl2IWLIUzI68TFMAtxjvc0E4yhROsqlzIrSNtRFwlms6+i
	/ebIZZAY9j0vAeybx4QTmbdGWuD4Od28GHHSsTMXVAqaJWtDC9qNNEOl9eKoAB1jf3Ys3v3xa/h
	GfUN/ICdXcoe9RYmx8tRMajYETXAUr0LxArSUDu69Kz0AnaKO2XbQRsS0Boru/TUgdK252OUO/w
	QXI+Whcdz23yFkjoLZ4ZLkPwm0sZb6wg9411WOQS3Xs2HmaB3YUFhcL4VIkSjFW5dkJGSOE0dug
	/xkO2g==
X-Received: by 2002:a05:600c:470e:b0:431:52f5:f48d with SMTP id 5b1f17b1804b1-438dc436f30mr209582335e9.31.1738611994941;
        Mon, 03 Feb 2025 11:46:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExzO583g33zUPWRI/zcaL35RgYJp4iCWf0jOXygzTMxI95IkQaUBxik56T44eVLnel04j5hw==
X-Received: by 2002:a05:600c:470e:b0:431:52f5:f48d with SMTP id 5b1f17b1804b1-438dc436f30mr209582095e9.31.1738611994560;
        Mon, 03 Feb 2025 11:46:34 -0800 (PST)
Received: from [192.168.10.3] ([151.62.97.55])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438e236f9bfsm170727385e9.0.2025.02.03.11.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 11:46:33 -0800 (PST)
Message-ID: <93df442c-8ec3-43ee-aba1-e770a5b7588f@redhat.com>
Date: Mon, 3 Feb 2025 20:46:32 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] KVM: x86: Add support for VMware guest specific
 hypercalls
To: Sean Christopherson <seanjc@google.com>,
 Doug Covelli <doug.covelli@broadcom.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>, kvm <kvm@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Shuah Khan <shuah@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, Joel Stanley <joel@jms.id.au>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-kselftest <linux-kselftest@vger.kernel.org>
References: <CABgObfZrTyft-3vqMz5w0ZiAhp-v6c32brgftynZGJO8OafrdA@mail.gmail.com>
 <CADH9ctBYp-LMbW4hm3+QwNoXvAc5ryVeB0L1jLY0uDWSe3vbag@mail.gmail.com>
 <b1ddb439-9e28-4a58-ba86-0395bfc081e0@redhat.com>
 <CADH9ctCFYtNfhn3SSp2jp0fzxu6s_X1A+wBNnzvHZVb8qXPk=g@mail.gmail.com>
 <CADH9ctB0YSYqC_Vj2nP20vMO_gN--KsqOBOu8sfHDrkZJV6pmw@mail.gmail.com>
 <Z2IXvsM0olS5GvbR@google.com>
 <CABgObfadZZ5sXYB0xR5OcLDw_eVUmXTOTFSWkVpkgiCJmNnFRQ@mail.gmail.com>
 <CADH9ctAGt_VriKA7Ch1L9U+xud-6M54GzaPOM_2sSA780TpAYw@mail.gmail.com>
 <CABgObfb3Ttfg6H+_RpNQGSYKw9BLEwx3+EysXdL-wbpd1pkGHQ@mail.gmail.com>
 <CADH9ctAzffvDByS1s2PJoD63On-b+pCnCmER4Nf4Zc=62vkbMA@mail.gmail.com>
 <Z6Eb4PfmmHWFTR9A@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z6Eb4PfmmHWFTR9A@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/25 20:41, Sean Christopherson wrote:
> -EFAULT isn't the problem, KVM not being able to return useful information in
> all situations is the issue. 

Yes, that's why I don't want it to be an automatically opted-in API.  If 
incremental improvements are possible, it may be useful to allow 
interested userspace to enable it early.  For example...

> Specifically, "guest" accesses that are emulated
> by KVM are problematic, because the -EFAULT from e.g. __kvm_write_guest_page()
> is disconnected from the code that actually kicks out to userspace.  In that
> case, userspace will get KVM_EXIT_MMIO, not -EFAULT.  There are more problems
> beyond KVM_EXIT_MMIO vs. -EFAULT, e.g. instructions that perform multiple memory
> accesses,

those are obviously synchronous and I expect VMware to handle them already.

That said my preferred solution to just use userfaultfd, which is 
synchronous by definition.

Paolo

> "failures" that are squashed and never propagated to userspace (PV
> features tend to do this), page splits, etc.


