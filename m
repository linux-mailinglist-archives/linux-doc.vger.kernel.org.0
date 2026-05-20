Return-Path: <linux-doc+bounces-88684-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eACiHPcZDmpT6AUAu9opvQ
	(envelope-from <linux-doc+bounces-88684-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 22:30:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D31AF599B5F
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 22:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9380F30433A5
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 20:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F145036F42B;
	Wed, 20 May 2026 20:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZvvUx12"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C7370ADA;
	Wed, 20 May 2026 20:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779309035; cv=none; b=epqxLZao3aJtKNYWdiBP3k7oYRwlDBoc+WWEeK9g1c0U0bY9URoKasAUaJ+lHBBDByGcqqRp1Ed99ZA/H4QxmDjhpWDuipFMWCblTKI0+hb+UNj+tGTyhHr573G01drsQJKyg1AiO9lYbwgAcjgu83W2VHk89u8vB4fdUNOnqQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779309035; c=relaxed/simple;
	bh=QULFTVl/eeTApBE2Sn1tn6yq4EcAmMyKVi9O2JqVX0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DizB3L9NXgT9uEiQebAp3iKzeOlY0fNvP83oZb85nP9UNwprcLnJi2C762hIukPwkBXCAq0KOilD2MdymoXrQTPBFXKXR/UraCXRGM32pP18bmcWfktpqAwMuIevi0QwiUk7+baLireDODQFxjD0pyoPfbCiqAe4DVHGAoiluOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZvvUx12; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FAF1F000E9;
	Wed, 20 May 2026 20:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779309033;
	bh=8gAPUPjfrE3UAcjTz5i5qAfaXCJfTVBVetfeTAQEG2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TZvvUx12EMG3urgCpbjylJRkIQ0EFK9qCcz+ILOJcC56JFkDW0HJvkIv5FzohOEo0
	 734VYB8tUbFGbQjeuWQpWt8zVY4RtnOe2pdLNFeff8v0eDhWKYs5HNl4JxOdDsXPCg
	 sSH0VDHYruAWsJR/en8vBNWgWosCQPKYeDAC24eIuNL3Jkt79J+ouNBOV9UENFYGw1
	 pUw7b1BxbwKIbs2zV4U6fQy+yPFJwI2I1JZ7J3718jNpUR4flAZxtSb3nbLjFyDMNB
	 XMpjqMfc70/U8NobFk3DKB5ZslHOIeS21VZf+dezVtPSlMibhxCnqZu3KM4AfJsBbZ
	 yxFdYmyM2/IMA==
Date: Wed, 20 May 2026 20:30:31 +0000
From: Yosry Ahmed <yosry@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Subject: Re: [PATCH v8 0/8] KVM: x86: nSVM: Improve PAT virtualization
Message-ID: <ag4ZwD53B7a0ivgT@google.com>
References: <20260407190343.325299-1-jmattson@google.com>
 <177915062620.2226127.1264745848157211491.b4-ty@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177915062620.2226127.1264745848157211491.b4-ty@google.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-88684-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yosry@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D31AF599B5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 05:41:06PM -0700, Sean Christopherson wrote:
> On Tue, 07 Apr 2026 12:03:23 -0700, Jim Mattson wrote:
> > Currently, KVM's implementation of nested SVM treats the PAT MSR the same
> > way whether or not nested NPT is enabled: L1 and L2 share a single
> > PAT. However, the AMD APM specifies that when nested NPT is enabled, the host
> > (L1) and the guest (L2) should have independent PATs: hPAT for L1 and gPAT
> > for L2.
> > 
> > This patch series implements independent PATs for L1 and L2 when nested NPT
> > is enabled, but only when a new quirk, KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT,
> > is disabled. By default, the quirk is enabled, preserving KVM's legacy
> > behavior. When the quirk is disabled, KVM correctly virtualizes a separate
> > PAT register for L2, using the g_pat field in the VMCB.
> > 
> > [...]
> 
> Applied to kvm-x86 svm.  Yosry and/or Jim, please double check the result, the
> goof with patch 5 was slightly more annoying than I was expecting.

The result looks good to me. I also ran the selftest from v7 and it
passes. I couldn't help myself from reworking it and cleaning it up, I
will send a patch your way soon.

> 
> Thanks!
> 
> [1/8] KVM: x86: Define KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT
>       https://github.com/kvm-x86/linux/commit/822790ab0149
> [2/8] KVM: x86: nSVM: Clear VMCB_NPT clean bit when updating hPAT from guest mode
>       https://github.com/kvm-x86/linux/commit/0a8aeb15848e
> [3/8] KVM: x86: nSVM: Cache and validate vmcb12 g_pat
>       https://github.com/kvm-x86/linux/commit/4b83e4ba836e
> [4/8] KVM: x86: nSVM: Set vmcb02.g_pat correctly for nested NPT
>       https://github.com/kvm-x86/linux/commit/02233c73f8ae
> [6/8] KVM: x86: nSVM: Save gPAT to vmcb12.g_pat on VMEXIT
>       https://github.com/kvm-x86/linux/commit/d65cf222b899
> [7/8] KVM: Documentation: document KVM_{GET,SET}_NESTED_STATE for SVM
>       https://github.com/kvm-x86/linux/commit/32ebdbce3b23
> [8/8] KVM: x86: nSVM: Save/restore gPAT with KVM_{GET,SET}_NESTED_STATE
>       https://github.com/kvm-x86/linux/commit/4f256d5770fe
> 
> --
> https://github.com/kvm-x86/linux/tree/next

