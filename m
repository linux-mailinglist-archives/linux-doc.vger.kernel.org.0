Return-Path: <linux-doc+bounces-95415-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EoYTF5QnTWqtvwEAu9opvQ
	(envelope-from <linux-doc+bounces-95415-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 18:21:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E8471DCB5
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 18:21:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=dqn5gt3A;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95415-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-95415-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52F3A3019809
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 16:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8221A1DF980;
	Tue,  7 Jul 2026 16:17:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081CC433BDB
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 16:17:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441056; cv=none; b=u/UBYFuhLAQbeoqpG0iMVoKW3FwV6t55Zqkl9rOCvDb8Q3rLizVzJbx+mAaF7qYQ2VxtHGHu1aV8thj1rkXva7Q9sDmyyLdmQqgzvsDqIZUSJNSLBLI/BXwysSlO1fKh3F4b/dxaKx1BdXybQ5/xdamr2hBHid0lX8N4XNAhFj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441056; c=relaxed/simple;
	bh=Al6q5hSzbakCy6OHe7OE0sutONb/Jedtd8RaoFJGZSw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xg25rTRjRCLsEcxwNUTrA/d9t9d/zpKiocVx4eM8S1YYFZw8fSti3ChJja1dVS2Z+a0hNk66UhQvn1/GQjOySl/nb/GSEzkuGZULFoccrFYm8MsFZigXkmhsSdZ0mcxjGStwGT9zW0nTB3FQuwe4jzopNjgiqg0kmGTFI/UV27A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dqn5gt3A; arc=none smtp.client-ip=209.85.210.202
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso8787088b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 09:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783441054; x=1784045854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Al6q5hSzbakCy6OHe7OE0sutONb/Jedtd8RaoFJGZSw=;
        b=dqn5gt3ALNtUxpyQsP4DBIgwh/sLTH5z74M7MjJQoV9JhhpmiMSa0GFGBEdf4EtXtj
         jaHKMY1jxlU/uS9mnH/8RBAOLaIyXKwIATM9qO8WIvl438sgIQafXZR4gzGnGowCiZfH
         mmgS63j8EYi0qkgtACh17NbloZmNEvJV/tYsMmP1qlC+wjK3JHlQbA1cEJvho5zQ2xbB
         9jl9yUUMMDpxQpH1r8nQRbWE2Ywf7Lak4tQOGIYE8Ipu/nsL1ZIWq4E86S27g0StD1Ng
         0g490i45h4KPleA8FNX5kkBmV9Yd+LwnqPPBblOvWCIUYxsDHLFB2hWy4s4jqyUYuNrr
         jBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783441054; x=1784045854;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Al6q5hSzbakCy6OHe7OE0sutONb/Jedtd8RaoFJGZSw=;
        b=KOSPQG/6OFd5XVNzbEpAUF6gaxdJWm/LnxHNDFszD3is86YZ7dJ2c0jLYipe6qSoq0
         GnwSu7vPPoABFrK5ayyn2t9qIQNbh3nC1Qr8LD5XsLYzG24BMIHGTEIhMjNWSV1IUcHm
         1QUeEA2b8/IR32Ve7mJPQ2vbLp72bbibJXJK4LCMSdJxITnzO85Qun1EytMwr7vyyrop
         9kDGgtLFgbHwUH3eM0BaFzmgtHD7o1atslTlGDWDu6Vp1eGZJEVMLR8u2lMsJgzE9vyU
         q3BjvrV/sQo5ZYszczgdcyuzLtI1tPLzpgp/4Po88PsbkdrdT66O0ifjtyO7vMSQPcSa
         GzXA==
X-Forwarded-Encrypted: i=1; AHgh+Rpr23jtmkuXfplyW+XmpvmAysseMpYYWWOpDrfkWxmO4DNd3DPThxYE9bi2JAsEcOpmdJWy972CeaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YylBzb0awA2UnQ36JgmlnsDPlcX7EIUfdeM/eZZ+OVN2iGo940H
	wqnaKXnuNAuJ1WWc+tD7P2+8jRtieReQQOqzKg94L/q90juPw65jfOLZXJe/bqc4JXG4BCELBYR
	EMbcVOQ==
X-Received: from pgam21.prod.google.com ([2002:a05:6a02:2b55:b0:c99:d21a:f6b1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c786:b0:3b3:be05:2b73
 with SMTP id adf61e73a8af0-3c08ecd72famr6686068637.18.1783441054198; Tue, 07
 Jul 2026 09:17:34 -0700 (PDT)
Date: Tue, 7 Jul 2026 09:17:33 -0700
In-Reply-To: <f2b2a3a048ad6429305e0e21319a8c27bedf39db.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com> <f2b2a3a048ad6429305e0e21319a8c27bedf39db.camel@intel.com>
Message-ID: <ak0mnZKoxK5Y04Dw@google.com>
Subject: Re: [PATCH v6 00/11] Dynamic PAMT
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, 
	Dave Hansen <dave.hansen@intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"tglx@kernel.org" <tglx@kernel.org>, Vishal Annapurve <vannapurve@google.com>, "bp@alien8.de" <bp@alien8.de>, 
	Chao Gao <chao.gao@intel.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95415-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:rick.p.edgecombe@intel.com,m:kvm@vger.kernel.org,m:linux-coco@lists.linux.dev,m:kai.huang@intel.com,m:dave.hansen@intel.com,m:yan.y.zhao@intel.com,m:kas@kernel.org,m:mingo@redhat.com,m:linux-kernel@vger.kernel.org,m:pbonzini@redhat.com,m:nik.borisov@suse.com,m:linux-doc@vger.kernel.org,m:hpa@zytor.com,m:tglx@kernel.org,m:vannapurve@google.com,m:bp@alien8.de,m:chao.gao@intel.com,m:x86@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9E8471DCB5

On Mon, Jul 06, 2026, Rick P Edgecombe wrote:
> Sean,
>=20
> On Mon, 2026-05-25 at 19:35 -0700, Rick Edgecombe wrote:
> > =C2=A0 KVM: TDX: Allocate PAMT memory for TD and vCPU control structure=
s
> > =C2=A0 KVM: TDX: Get/put PAMT pages when (un)mapping private memory
>=20
> Would you be willing to take a look at these two patches that need ack's =
from
> the KVM side? I'm hoping to make the next version of this the last one. S=
o it
> would be great to get any remaining comments before then.

LGTM beyond the to_tdx() and Assited-by nits.

