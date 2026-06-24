Return-Path: <linux-doc+bounces-93435-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sJNUGd5aPGqbnAgAu9opvQ
	(envelope-from <linux-doc+bounces-93435-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 00:31:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4366C1C4D
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 00:31:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=kXObEAmO;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93435-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93435-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 59538300D556
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 22:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221D23B2D04;
	Wed, 24 Jun 2026 22:31:51 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10A63B3BF1
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 22:31:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782340311; cv=pass; b=rLEcxo2XnDG6wTMlzz36KAL+27nL0MCXxCFwtWYg8oSpQlNFleYpqffmBj9+j/BEsR+NXF4VDCHhF7SRC/RNHjyGzUl58gMWoxikSlLT7nPvSQejqtvDEN3cH0Ju2qq0c//4HXcfeI5Ni6L67MM7xZi9KyQNxs6bj3FohPsjnmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782340311; c=relaxed/simple;
	bh=Ac4SnsNXN8rEQTk23iatkBhfXxnOeNd/KNnr5r577/A=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHGIU/eNfPqDLnoRvIzjjrjWg84BLAedr03wdjPBDE39oeCkgYl3JBBsV4gWqULiyUh/bpFby7iizYTMIUL0hXozy+UZZTKFiIhwnc2CnrhqHEiryajBbv8qMZUqebBcARFmw6csD55MBSlQIPMpDFMp/sxlV3jIgyEEZek5QMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kXObEAmO; arc=pass smtp.client-ip=74.125.82.45
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13986d61b4fso2351249c88.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 15:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782340309; cv=none;
        d=google.com; s=arc-20240605;
        b=lAsTMWfo/t9OAg1k1WIvSBZYegi4W1fssQ4pamR7w86LulRqHoZstGZI0tKCyVOSTi
         lvtR+1Lyn5v39C+2DFOglTQgpU5NO6QFj/wD8VZCf5FDux0evWcqr4dIIQfi8DfDsgnG
         9wO9EQXNqfzYF2apIQlSL9Lz3HfLKgY4BcizY1FeA768/t6qitnYBr64TddTn6t44TiQ
         jAgCzxN+yNtv+/0/GWTllBGoutTSnk1KypNArMsalror9d1StpCe+stTapF7+cSgfE/8
         YIidujX3t+taL68b3DbsF0ftBO5AgWcn7R5yMRajQxK59vQQT1sHtMkSSyVw3WRTB10y
         PNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=N6i/SOXitQvG69KsKOuqXfKe3MaqkPv8vgabs7K/yu4=;
        fh=0Xq33LS3uCGU6+IaHiVaFd1/K6Q0Yme1J0CZ61KhJuM=;
        b=lNyJYOTo7SpcI91wwaOGYzEdfocaIa1oSVOYaZ8bf8A5i+Cp5+WZLnYYqckySsS1bc
         8ME35Rf0YfQgD+54KmtHIIo0tlFrWj5ptsjX/+9XkL7xB1CUzWinAs0XoH8t9u6CQWiN
         k99g2gL5meBnoXxN9sYiOPo1mNwkwT4W8hUcTy5bVuRNzwmGjsbXgIBzAOYFEg0WfqyJ
         d2LHoyXXfpyzdRn4luPIxXh9jeo0O0Z4yB3H9RFchWCde5VIGeC8vifutz8LmBP1DjgS
         nCya7WSC9craqXMwsA+BHQjEPneA83Hk2eF6yXpLOnjHBUPkXjyncHSO4WSm2/h9VbmZ
         JqBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782340309; x=1782945109; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=N6i/SOXitQvG69KsKOuqXfKe3MaqkPv8vgabs7K/yu4=;
        b=kXObEAmOeWU3iGzGqynePW9vunurhr4tXDrm3kJ2Cz9dCW8c0pi4ePkiJhdBbB0r2h
         w2/+t/hVRBLgpq0dTtIQvLqCJTmnZ16KNtEGT3BG8nimWzD7EBPiMzIYkIrQ0jsf3cbH
         LqCrTgOTl+1z4VqvDpsuuODCr33rr3qU+phQFm5bVgbQMlqnrTmNVDjU7+JqzSw+vOMc
         ggWC08/3T+MlomMQSP2Eeb7JXdSZK2ox02iFGX6yqQanH03l9+ftp8gaFMwFSmIDKEaK
         ybqAQ3aBIj4bBlXeIN1nGnVP+fb4On6GNfk4+S9EYul2hXXeZBoE12ny+sl//VsX8LrI
         PiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782340309; x=1782945109;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6i/SOXitQvG69KsKOuqXfKe3MaqkPv8vgabs7K/yu4=;
        b=eXSsP9/a+v0DCtDW1fljQM0ziNV98KWOE6+fCXv2ErZKPcwQKcR/bxr13mcf4tF4RT
         8TgSWUI81IeobmzpGo1Ync+2K9lrVGOWqSq2pQrMAYdaQNZdlCiL7gktWLphApDMc8RM
         Yat48s1Q2gdhiAd25rZ9R+1ciKYXUQZzdV3Is/n8eC0T3KnvoptjOK9IzNsRv5c06Uos
         un/LqMAmzjEqK0qQxXFGt+hKBWqginths+Bfw/yLj6dRIva7ejfu9B1oczn/ann6/CDp
         LQPyCvtDb16eD1AxLGpo+LaCenwQ/WcqEur8lC0rnufyf6AfApO3AH889+1j3iYgz5X0
         6OSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gCkDwBUq73I3MAjLcaZGPgcrZsbdUBy0gfcM/eRk4Trm38TsLc94a4DsuAt30tpX+/UnpHc4+I5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YySj6yV0k+gExG3gYNKZUqZxs6jBAnpwKhEnQ9VE3S1sk1oiA6/
	GDDclozYXZKonITgpskEpoRa+8Z60fSXarQ6rmHJJxDJKKM/YRYe4pcg6qtRAV/P1VB2DPmVMKo
	RojouFJ29dvos9ib8G9y5seHYrvgZ5iui1xKRzIV4
X-Gm-Gg: AfdE7clXYFie0vU+uNbPGp5fgwTwRtoZRjUFr52jLcI9Qf4J8/3FlEawvkGmQyiTqq3
	GpbotuMxoYlpI63kcY6tJ37DjffYbsjPiTY21rAph2bDwbVLoqzFXrgB8HweDO6l3kLg02t3Xdf
	mn8OnUCbgYA3Adz8t3+jFYuX0BF+KSAOH8+CqEkgObZPsXh5G++yTEl6eJTCznAgOQMmx+VLrjn
	xa5iPFo0iDhVB/TWAhyksG1Ij3lwNuF0/OYfgD2bV213csoHYAm/cSoMVNyp6LPABI7b7A3cL8V
	jG3WXr0bZeQqcw6Rn9B2QH58i9etxBUKYgASxKEbyQfqWuK6PWFyPtcEPHtYwic442AIJg==
X-Received: by 2002:a05:7022:f687:b0:136:e639:9c05 with SMTP id
 a92af1059eb24-139d0c976b8mr3775881c88.31.1782340307804; Wed, 24 Jun 2026
 15:31:47 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:31:46 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:31:46 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CA+EHjTz3SW50EzxgXm8VysoaM21RReUVG2px_WUYU7zUwjXnpQ@mail.gmail.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-22-9d2959357853@google.com> <CA+EHjTz3SW50EzxgXm8VysoaM21RReUVG2px_WUYU7zUwjXnpQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 15:31:46 -0700
X-Gm-Features: AVVi8CdGjNdamkK1obuu8yqfMxgZ_h-GaO78YorUefDXnXrkakD9WS-D2oU1DQk
Message-ID: <CAEvNRgGnSgYBwsgTh34uTTBvah12SE55LW=7Dm7RQX2U4sA7Jw@mail.gmail.com>
Subject: Re: [PATCH v8 22/46] KVM: SEV: Make 'uaddr' parameter optional for KVM_SEV_SNP_LAUNCH_UPDATE
To: Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,linux.dev,linux.intel.com,kernel.org,google.com,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca,vger.kernel.org,kvack.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93435-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ackerleytng@google.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tabba@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:suzuki.poulose@arm.com,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:shikemeng@huaweic
 loud.com,m:nphamcs@gmail.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baoquan.he@linux.dev,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ackerleytng@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A4366C1C4D

Fuad Tabba <tabba@google.com> writes:

>
> [...snip...]
>
>> diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
>> index bd04a908a8dbd..29409297f1ef0 100644
>> --- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
>> +++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
>> @@ -503,7 +503,8 @@ secrets.
>>
>>  It is required that the GPA ranges initialized by this command have had the
>>  KVM_MEMORY_ATTRIBUTE_PRIVATE attribute set in advance. See the documentation
>> -for KVM_SET_MEMORY_ATTRIBUTES for more details on this aspect.
>> +for KVM_SET_MEMORY_ATTRIBUTES/KVM_SET_MEMORY_ATTRIBUTES2 for more details on
>> +this aspect.
>>
>>  Upon success, this command is not guaranteed to have processed the entire
>>  range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
>> @@ -511,9 +512,13 @@ range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
>>  remaining range that has yet to be processed. The caller should continue
>>  calling this command until those fields indicate the entire range has been
>>  processed, e.g. ``len`` is 0, ``gfn_start`` is equal to the last GFN in the
>> -range plus 1, and ``uaddr`` is the last byte of the userspace-provided source
>> -buffer address plus 1. In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO,
>> -``uaddr`` will be ignored completely.
>> +range plus 1, and ``uaddr`` (if specified) is the last byte of the
>> +userspace-provided source buffer address plus 1.
>> +
>> +In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO, ``uaddr`` will be
>> +ignored completely. For all other page types, ``uaddr`` is optional if in-place
>> +conversion is enable, i.e. when the destination can also be the source, and is
>
> Typo: "is enable" -> "is enabled".
>
> "when the destination can also be the source" is hard to parse without
> context. Maybe: "i.e. when the data has been written directly to
> guest_memfd while the range was in the shared state".
>
> Also, how does userspace discover whether in-place conversion is
> enabled? A cross-reference to KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES
> would help here.
>

Will fix in the next revision. Thanks!

> Cheers,
> /fuad
>
>>
>> [...snip...]
>>

