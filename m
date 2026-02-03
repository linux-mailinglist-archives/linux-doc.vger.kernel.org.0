Return-Path: <linux-doc+bounces-75120-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEmJN3hfgmnTTAMAu9opvQ
	(envelope-from <linux-doc+bounces-75120-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 21:50:00 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A8DEA58
	for <lists+linux-doc@lfdr.de>; Tue, 03 Feb 2026 21:50:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5F3E301BC32
	for <lists+linux-doc@lfdr.de>; Tue,  3 Feb 2026 20:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0352DCF61;
	Tue,  3 Feb 2026 20:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juRPGVr0"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACFB23EA8B;
	Tue,  3 Feb 2026 20:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770151770; cv=none; b=XoanaotJnwGLLVT4XwsAt9x7z5gLMWWQhdce7PRj6Bv24UFDYIxfhRUo8SuClW/PNPeUQSVqk9DJ0tr9xhGfo1Q+qZ/+QNWpo/EqcIm1Y2t3smAc1XdFqAOdLUZVowox9AzX6wCtkUJoXnrjMIhCAxKY8K7QnRdmWSQLnlwC3Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770151770; c=relaxed/simple;
	bh=pHGo1C4Pz/uuXM8SzFth/6l/p9wgCvOIRRB+8irU9ts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rxRmDj2f+JhYOsuFv1GV3V/VRzuvSGXlEKGG5hxq3/KrJver3Z0PFjzo0SLglvGOIcNOI2B9ddkWAXN3VTPzjbtlX1veuEeIC1UkN+9hQVrg6WsUx3MEwTqXNsbUaiMfRhnBZIBSxjDLQ6qCAnJCN8DlJivNBMFPAw9qp4A/F7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juRPGVr0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD6EC116D0;
	Tue,  3 Feb 2026 20:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770151769;
	bh=pHGo1C4Pz/uuXM8SzFth/6l/p9wgCvOIRRB+8irU9ts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=juRPGVr0ejaE+JmDG7KMEy8WtkPk8ggSdc23YlY7ltfkvvyyTphbdBT4BrrHbzMH8
	 vvVr7IsJbdhiw+hkPzOBmzowaPLKKCwo48ht9c4cVB/9T4TPe4559zytFB9TZ99q6X
	 C3h2gjD/e3lQAbDioaIaNobGKqfJWA9Wrgjd3mo4FX063ISQeC+aTbEgZiIhHfMoF1
	 AZr7xX9NpgPHPMqCONPiwCYI0TPt/5VjeigC4/f24FPG6t+D3dTfOYmqf9oaiKnPIK
	 WZEWPrOF0j1sfKrYGseRHzYYcOCpmXkHZ8gANdbS9pESexQBbx1lTDPg/zoe4OABjf
	 11HE/Alv5Ldjg==
From: Thomas Gleixner <tglx@kernel.org>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: Alexander Graf <graf@amazon.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Clemens Ladisch
 <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, Pasha
 Tatashin <pasha.tatashin@soleen.com>, nh-open-source@amazon.com, Nicolas
 Saenz Julienne <nsaenz@amazon.es>, Hendrik Borghorst <hborghor@amazon.de>,
 Filippo Sironi <sironi@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>,
 Jan =?utf-8?Q?Sch=C3=B6nherr?= <jschoenh@amazon.de>, Sasha Levin
 <sashal@kernel.org>
Subject: Re: [PATCH 2/2] hpet: Add HPET-based NMI watchdog support
In-Reply-To: <20260203194429.GA30254@ranerica-svr.sc.intel.com>
References: <20260202174803.66640-1-graf@amazon.com>
 <20260202174803.66640-3-graf@amazon.com> <87jywu3yov.ffs@tglx>
 <1e13c61d-8581-4ece-b31c-7aa771ba7bc2@amazon.com> <878qd94zjo.ffs@tglx>
 <20260203194429.GA30254@ranerica-svr.sc.intel.com>
Date: Tue, 03 Feb 2026 21:49:26 +0100
Message-ID: <87cy2l363t.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75120-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 551A8DEA58
X-Rspamd-Action: no action

On Tue, Feb 03 2026 at 11:44, Ricardo Neri wrote:
> On Tue, Feb 03, 2026 at 04:28:11PM +0100, Thomas Gleixner wrote:
>> I don't remember. That thing clearly fell through the cracks.
>
> My impression at the time was that the buddy hardlockup detector met the
> goal of freeing the PMU counter and there was little interest on using the
> HPET.
>
>> Let me find it again and reply to that.
>
> Does this mean that there is renewed interest for this?

It seems Alex is interrested and the code minus the rejects and my
todays suggestion looks palatable.



