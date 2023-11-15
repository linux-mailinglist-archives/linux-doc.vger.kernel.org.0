Return-Path: <linux-doc+bounces-2442-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EAE7ED631
	for <lists+linux-doc@lfdr.de>; Wed, 15 Nov 2023 22:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 572341F24FD1
	for <lists+linux-doc@lfdr.de>; Wed, 15 Nov 2023 21:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856F0381A5;
	Wed, 15 Nov 2023 21:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hkUz4ree"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6169195
	for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 13:47:57 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a828bdcfbaso1129107b3.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Nov 2023 13:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700084877; x=1700689677; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AVofhr5wGwFWvEzT6FcMgy3uT0P0mNKGPdMhqUDmI3k=;
        b=hkUz4reexq4wbR2CZoZkc0JfyaZ/vIB+vektW0HnOWCDGD40Em2eaSzYaFC47FXkYA
         kluLOLMJ6eIZR0PvpofkgeWFePZDWi72YvOBD6QJqJ1FAFbHYzYecTLJ7F4qHTgtcWi0
         Ndae3YS3U/yGJh3nb5B5eoU1OJbfQpVUbwvimIhTIyCTYDsqVkrlse/+KzvGEEhzJL3o
         E2mYy3USzZPO4oVYUillmG/XGRRjfI1rFWKAbFc3lBDicZBj760VZWtAox2QWXBQyrvE
         9RfK9Z4I8hmapM/CtJRfkepBNj/eIPRHmTQA2sVa/gpc0Mj5VFpHBR8CSbB3CeOzuWJY
         PfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700084877; x=1700689677;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVofhr5wGwFWvEzT6FcMgy3uT0P0mNKGPdMhqUDmI3k=;
        b=VpdRK62P+vm76uJOYnWGan9+2wMptcEux6XoT3aVpTqzfDJ5MIF/qEodqocXOs4GKh
         ZInR46D8mAuAzzbEffYOJHvRhbY+QfWXIIICq+tBjPR7gioU5f2gt2omnikBnRefVoSk
         mR5+c+dId25DErpKogmpTgI5werAt4APRpN7qkNOhIeHIUSxtZntX2fD1sOI12Ck+un9
         +F3D0s5VipUcSgjYxoqpv3tVGwXZ2NMCVNmOywL+KYQ0l+VTkHGQ7miRBs7sipm1pXWs
         TA3QQgIIVhl+MGyYG5lXPn+d6CCbaflSOYHAoOwquCGpJxQX3ZWUQmPmnJyFKL1+VCC1
         cNUw==
X-Gm-Message-State: AOJu0Ywlco/0ysSCRtUmCOG1P7K4PphDyAEz4POYAIBTeWma4GbklESw
	JnVEVxSCImEhdI7PXyfe9ikE8qZ/IEg=
X-Google-Smtp-Source: AGHT+IEwXcE+qc2AUynC23bL6SDbinjBCwOcWAt1KwnIz/4V/9UZnbvZqY1L6xvUXUDX+T972/189Y1Tr6I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4e44:0:b0:5a7:af47:9dda with SMTP id
 c65-20020a814e44000000b005a7af479ddamr393815ywb.9.1700084877183; Wed, 15 Nov
 2023 13:47:57 -0800 (PST)
Date: Wed, 15 Nov 2023 13:47:39 -0800
In-Reply-To: <SA1PR11MB67345D35CE3FB950A0C90BDDA8B2A@SA1PR11MB6734.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231108183003.5981-1-xin3.li@intel.com> <20231108183003.5981-7-xin3.li@intel.com>
 <ZUyjPtaxOgDQQUwA@chao-email> <SA1PR11MB67347A31E38D604FDF2BD606A8AFA@SA1PR11MB6734.namprd11.prod.outlook.com>
 <ZU12zoH8VtcZ_USh@google.com> <SA1PR11MB67345D35CE3FB950A0C90BDDA8B2A@SA1PR11MB6734.namprd11.prod.outlook.com>
Message-ID: <ZVU8exa_l28ZbRsG@google.com>
Subject: Re: [PATCH v1 06/23] KVM: VMX: Defer enabling FRED MSRs save/load
 until after set CPUID
From: Sean Christopherson <seanjc@google.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: Chao Gao <chao.gao@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com" <haiyangz@microsoft.com>, 
	"wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>, 
	"peterz@infradead.org" <peterz@infradead.org>, Ravi V Shankar <ravi.v.shankar@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 14, 2023, Xin3 Li wrote:
> > Implement what in a different way?  The VMCS fields and FRED are architectural.
> > The internal layout of the VMCS is uarch specific, but the encodings and semantics
> > absolutely cannot change without breaking software.  And if Intel does something
> > asinine like make a control active-low then we have far, far bigger problems.
> 
> I should have made it clear that I wasn't talking at the ISA level.  And
> of course CPU uarch implementations should be transparent to software.
> 
> I mean a CPU uarch could choose to check the activation bit in the VM exit
> controls first and then decide whether to load the 2nd VM exit controls.
> While if resources allow, a CPU uarch could always load the 2nd VM exit
> controls.

And why does that matter?  Loading a field speculatively/out-of-order is fine,
consuming it when it architecturally is supposed to be ignored is not.

