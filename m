Return-Path: <linux-doc+bounces-93608-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AfTNHp1vPWp93AgAu9opvQ
	(envelope-from <linux-doc+bounces-93608-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:12:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AEC6C81BF
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 20:12:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=vmBjccB9;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93608-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93608-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F4BE302C0DB
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 18:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F6C30BBB9;
	Thu, 25 Jun 2026 18:12:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F95627B32C
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 18:12:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411138; cv=none; b=ZHpFtF+DPWHbaTGeDWi1C/NS0KuKD6644SCD4GgE71rM2HNi8dOZ+iIT12bP1Y0OUPPYOKpN1IX2+G02B7UzqF2zGBunDC+7CfhqS8tLDyclYrjDb0vwpMvGW1vbXk8a1IhDn/AK5NkqmvPSbsYwzl+t/qGhdsaAvveVQuAnA0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411138; c=relaxed/simple;
	bh=yjS5dSFpPH1rBFGssmlHMMVeXCrnNZvGHXjHEcEI96E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u9prcT+sCWO0xETXvd33jMbASfFoc66qJbQ6MkwtuJmHysYSn0WmxpUJ4LY1Qp2b7Fzj9tzH561s/eHBAPoRZFTXapTRZgIbZqduP0h+SltdLsnQ2zxKwqYM8pIklQhD2MdWUP4tElvsHb0QfzHMVhpf+BxjIbywV6DvlrSlt7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vmBjccB9; arc=none smtp.client-ip=209.85.214.201
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c6afd85980so1369665ad.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411137; x=1783015937; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjS5dSFpPH1rBFGssmlHMMVeXCrnNZvGHXjHEcEI96E=;
        b=vmBjccB9Uf0R1moGG4Y9i5cLWx0spZYgmPae2EWn/lMKNQM4N66k6HcgFHoTNb3F5n
         Q+wGIPpdOshwLgp+Mh3sXDQ4o181CUAOX0CY5TVlUKe+SxTME1gukcGhaMWxyvFk7Zlj
         1gJIaSlC0muIW4njMXWGmWKd9E+7Gqz4nItSKag2JUd87XMi+o2sfY50Kc2jR6kavrA+
         XUMbbsC2Bav9OYnWBLiVGApfY5FcZrnmMd5sv66MO41E3dmx5AMk5f+Lm2RK3eAgh8iq
         kp597EovKagw8AODId+hsk1r4fWoL7hI+iU1NjTegHey3Twb547wrochEEGr1inh6TJ5
         fn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411137; x=1783015937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjS5dSFpPH1rBFGssmlHMMVeXCrnNZvGHXjHEcEI96E=;
        b=TyJkzZNO070qEPZZKxpzr1B8+Pp73mveI2NwP4Bl+tkS++PYTmy88Cz6jO3836w1rw
         NRdL6/7gtUYaGAXn+q2QVs03cPRCRM0nzrvzma86RrWl9VxlVtrDoxRTmHbTm6BPWwS6
         mWeCV2KbNDDeT9n29FBv+BqreoEZWWDPi0HOKlI0P+J/Df3UOLUQnqiPu+qucvmXGmQF
         o2MQR2zwipy2pQQ4iiX5d68ZqpWRJjL3Dc5fBTAE/wmyz/oENEqyLGodT+GZEywEutKJ
         t8OwrDuCCdd6lf7JBvOQnHfQadX2JZJ8+18ERK0dfFhx8JRk5EI0Sr47FPXvov3B35VH
         OtjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSo/RGeXS57UL5DQYU2QrfGktq3NjsLN/ItOEnwhxP2FrHe6Gwb7NMq691kJSB1+WqphEf+Y0pMvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YypZU+ifJhjdxab24kxZ8tYFWf4uOJ/qc53rqG6Yv1LxYltuMAN
	TfGFNXmBCND7VHDRr1bSpP9nKr89Ig1w21KAa/xxQHxHnDJBm87yHsKDbJXge/DlIBM3o3Z11mV
	5qBeEgg==
X-Received: from plht13.prod.google.com ([2002:a17:903:2f0d:b0:2bf:17b5:30c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea07:b0:2bf:2369:a131
 with SMTP id d9443c01a7336-2c7fca0df92mr40937135ad.34.1782411136519; Thu, 25
 Jun 2026 11:12:16 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:12:15 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-2-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-2-4fe8b602ff47@google.com>
Message-ID: <aj1vf7HXJXvHi20f@google.com>
Subject: Re: [PATCH RFC 02/12] Documentation: KVM: Consolidate notes about
 cpu_read_lock() and kvm_lock
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, vannapurve@google.com, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:zhaotianrui@loongson.cn,m:maobibo@loongson.cn,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:tabba@google.com,m:vannapurve@google.com,m:x86@kernel.org,m:hpa@zytor.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-93608-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4AEC6C81BF

On Wed, May 27, 2026, Ackerley Tng wrote:
> Move the detail about cpu_read_lock() and kvm_lock to where the acquisition
> order is mentioned.

Why?

