Return-Path: <linux-doc+bounces-73286-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKqfKk7Jb2mgMQAAu9opvQ
	(envelope-from <linux-doc+bounces-73286-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 19:28:30 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 761B849733
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 19:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ED80648D3CC
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 15:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46C943C062;
	Tue, 20 Jan 2026 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i/nUckfs"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0BF4266B2
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922717; cv=none; b=dKFC8X2a2nfD1/iB3AXqCXGc7lvZSeuiDFE+giQOra84DSCMqgipCafzeQND0+7B0huk1PylTN3gg7caz7HfSewcGSRRUNt3+Pzi5NWT3tcHYce/y7nYBQn3eSJ2P620ePJLRVJmsjmysPwGlV+c5Eoi55RiLaiHxRmBCb3ruLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922717; c=relaxed/simple;
	bh=Vr1w8/hRlrBVQxV/J2giFIsqc9Obiu5qNwZxH6Kan84=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n5eakXvwtVHwi6OG2p9i4QCcX3VTocPqQ4fr8duJa4Fs2A45fFc+doUBdZn9/HtlLBmuMPWlBJKnPzkD4YLuQEBM0yqo8dzt4pmzDng4sDkTOpIdzGe3VXb56thkvmyB1im7wdKafK5Qy1UpcvN+Ymz4oNbhaVOo0PXFX7Rr970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i/nUckfs; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a773db3803so4851745ad.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768922715; x=1769527515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZLSVE2MzemDrn9erRb2jucT/zlZ8W02NgFFC89SMHc=;
        b=i/nUckfsUDWExv4d/o+j6+CYPL8bgKLLUEPMHIR8Ytv+QtnCRyzWmxhIos1svsDPM0
         9m/nA23JRXNV6enPp3ijYDYffpGxuYxj9WAeQXN9RTJlwlLvJz3zeyAkMB26J4i4oE3i
         jFWmClUtX2fsbl17kK+DuVmwjGwnZ2aHY4pek/KFc3KMp9jC4x8EFLK+cG6d5drfn10/
         qKfOruiLeAXCKqZbP6iWafXnCiz7kXHThpXOoIEtgc2+IBSNbeN7SgKrG7RI0uNRmGVH
         S7tlQg9omNJ8mclN7vfWyX6lg51ToM6wKzrJsb+Wo80DDdDkXKcqwZmbSIrWqNkUtCeL
         aITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768922715; x=1769527515;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UZLSVE2MzemDrn9erRb2jucT/zlZ8W02NgFFC89SMHc=;
        b=FqQ5CrvlY7rKWLDsYLVVjCML8veM4Jy6PvxiJAiMLTgRaO6vWiC2K0aEtdIcj2w8+L
         nXGld/q9oic261MKtqwddCmrDzdn4p9bFDmKUonDx9aRHXSUCctkxhl6fSmGDEcnC13p
         MURhN5P14NTUk+CxpxborNBV0zH3QSs7pCzrRfJBxGIm1pF+zT1nGAnBCsNyAWqUx8+B
         LZ1+zenpgtyFYsl6yLgR+ORYQsH16UfEpt9goyQU6Sh6tB3GZaSMcBCvXF2PRddrPOuP
         uSJJq4GyqbvscpsZa95Lm7cBKeXvljmUkoX1Z2xyIN52Qkglx8zJaQ2pt0+aLELrolIp
         KW3w==
X-Forwarded-Encrypted: i=1; AJvYcCUg6/z56z7MD237/ylqrp7FN8nwu6jJcIjsxfhM/LEY8uGhxd1hR+nizoOj5K8QxH8HCfnKHGEBppA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYUANZkXa0M1RGQjIYesAQtv2uQjm9xnkklt0M/jQUjUgfoSvM
	1I9FUUPblG2YlRfyvYEcbGHbtAgBRDNr2aTpbpiQ3rXv9bsUqfYnb7FFBDDyHdq78z7WcD0/M/h
	vOHhmxw==
X-Received: from plps11.prod.google.com ([2002:a17:902:988b:b0:2a0:e5e4:2e05])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e80b:b0:267:a95d:7164
 with SMTP id d9443c01a7336-2a717808c2dmr127036045ad.60.1768922715334; Tue, 20
 Jan 2026 07:25:15 -0800 (PST)
Date: Tue, 20 Jan 2026 07:25:13 -0800
In-Reply-To: <04d96812-f74a-4f43-9ea4-c4f2723251c5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251026201911.505204-1-xin@zytor.com> <20251026201911.505204-18-xin@zytor.com>
 <aRQ3ngRvif/0QRTC@intel.com> <71F2B269-4D29-4B23-9111-E43CDD09CF13@zytor.com>
 <aW83vbC2KB6CZDvl@intel.com> <C3F658E2-BB0D-4461-8412-F4BC5BCB2298@zytor.com> <04d96812-f74a-4f43-9ea4-c4f2723251c5@linux.intel.com>
Message-ID: <aW-eWcj5GBZfGerc@google.com>
Subject: Re: [PATCH v9 17/22] KVM: x86: Advertise support for FRED
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, pbonzini@redhat.com, 
	corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com, hch@infradead.org, 
	sohil.mehta@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73286-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[google.com,reject];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,intel.com:email]
X-Rspamd-Queue-Id: 761B849733
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026, Binbin Wu wrote:
> On 1/20/2026 5:09 PM, Xin Li wrote:
> >> On Jan 20, 2026, at 12:07=E2=80=AFAM, Chao Gao <chao.gao@intel.com> wr=
ote:
> >>
> >> On Mon, Jan 19, 2026 at 10:56:29PM -0800, Xin Li wrote:
> >>>
> >>>
> >>>> On Nov 11, 2025, at 11:30=E2=80=AFPM, Chao Gao <chao.gao@intel.com> =
wrote:
> >>>>
> >>>> I'm not sure if AMD CPUs support FRED, but just in case, we can clea=
r FRED
> >>>> i.e., kvm_cpu_cap_clear(X86_FEATURE_FRED) in svm_set_cpu_caps().
> >>>
> >>> AMD will support FRED, with ISA level compatibility:
> >>>
> >>> https://www.amd.com/en/blogs/2025/amd-and-intel-celebrate-first-anniv=
ersary-of-x86-ecosys.html
> >>>
> >>> Thus we don=E2=80=99t need to clear the bit.
> >>
> >> In this case, we need to clear FRED for AMD.
> >>
> >> The concern is that before AMD's FRED KVM support is implemented, FRED=
 will be
> >> exposed to userspace on AMD FRED-capable hardware. This may cause issu=
es.
> >=20
> > Hmm, I think it=E2=80=99s Qemu does that.
> >=20
> > We have 2 filters, one in Qemu and one in KVM, only both are set a feat=
ure is enabled.
> >=20
> > What I have missed?

The userspace VMM, e.g. QEMU, is completely irrelevant.  KVM must not adver=
tise
support for features it doesn't actually implement, and more importantly mu=
st not
internally treat such features as supported.

> If a newer QEMU (with AMD's FRED support patch) + an older KVM (without A=
MD's
> FRED support, but KVM advertises it), it may cause issues.

Yep.

> I guess it's no safety issue for host though,

Maybe.  Without fully analyzing the SVM implementation for FRED and its int=
eraction
with KVM, I don't think we can confidently say that incorrectly treating FR=
ED as
supported is benign for the host.  It's a moot point, I just want to emphas=
ize
how it important it is that KVM doesn't over-report features.

