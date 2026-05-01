Return-Path: <linux-doc+bounces-85407-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBzIGjNt9GlIBQIAu9opvQ
	(envelope-from <linux-doc+bounces-85407-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 01 May 2026 11:06:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 505934AB299
	for <lists+linux-doc@lfdr.de>; Fri, 01 May 2026 11:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 256F23005AE8
	for <lists+linux-doc@lfdr.de>; Fri,  1 May 2026 09:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F90E37D11E;
	Fri,  1 May 2026 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="aZsTTAWV"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8429B37D10A
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777626416; cv=none; b=gAElEt59S2i9hYqlqFbPp2NeBY3YEgY+v/uo+MVyfbrJ+ijQV28fCQtCAyNrF9v3AWJAisKAHJYiODHDkXdaGJXYas1FeO4x9mnG3h6BYUn8lwW2ChS8zub+7x2Lk/dWemOYdcTi0fXcB73nvAXsqcQxwBvikuaEfH3p2eC9TkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777626416; c=relaxed/simple;
	bh=5bpykIlYFSbI7ZN81EUe3sk1JDZNyJ+jgkYUxfGVYIk=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dvEk3EGE2wOinOvFi2IelCl3PSP47nNnfBCu80qvE2yJ7A1ad+kGYzz5LE8+WH2Fwvw+3XoQ4HoV+QducasfS8+bXGdTQcHRWnxjQYkqZxbxVuMgQiY8theusu+QS85QeG8pibyCtLjvegC2RQu0F4RgglEhM8W5i9FG+zioPZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=aZsTTAWV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5643140C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777626413; bh=D0DJSAzD7GxvPxASWC7ptINlipt3HDSrHwDvZPd/bco=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=aZsTTAWVj2pJzL7Nj0Ky1Bq0wjbS2tXEoq2lte6y4SxDtxCX3pQWCBdIPwNKibcEu
	 7pba8EKMYD4+UYCxeGwtB/Di0mNdhbv7hdqFIvO/D8o+oBUwx/DPDfaGJpVm94NKWu
	 Vxmv3IfnuQnvTqPjdyz09e2YEWe6dHFjOB7XgsNWrgAFnQ0OdwptR8D1qFJVQNnsEk
	 6qHCt4jhGIfdnqIhW2jqBC8/d5uJMU8yvia4ZaOAQpcBBoUhdxGkiWFNdGSdrAmFxr
	 CEiL5pttOo59+XJycBk+pomP9bsfIGl0uOKBg+Haa2ueI4S3r1vQeP6j2q0Wv/CbM5
	 UkG/V+xMtNxag==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5643140C79;
	Fri,  1 May 2026 09:06:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dewey <thawentha4@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [RFC] Interest in contributing to Linux Kernel documentation
 (French translation)
In-Reply-To: <CADWiQPK3kC5ymXsdYT6tc7qH47THfY=LpBSW3=dcGNO2Fi_p_A@mail.gmail.com>
References: <CADWiQPK3kC5ymXsdYT6tc7qH47THfY=LpBSW3=dcGNO2Fi_p_A@mail.gmail.com>
Date: Fri, 01 May 2026 03:06:50 -0600
Message-ID: <87cxzffqhh.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 505934AB299
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	INTRODUCTION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85407-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trenco.lwn.net:mid]

Dewey <thawentha4@gmail.com> writes:

> Hello everyone,
> My name is Dewey, I am a software enthusiast with an interest in the
> Linux kernel. I am reaching out to the list to see if there is any
> interest or an established process for improving the documentation by
> adding or maintaining translations, specifically for French.
> I understand that the official documentation is maintained in English
> and that keeping translations in sync is a significant challenge.
> However, I would like to offer my time to help, whether it involves
> translating specific sections or helping with the automation of
> documentation generation.
> Could you let me know if there are any current initiatives regarding
> translations, or if there is a preferred way to contribute in this
> area?

There are a number of active translation efforts; you can find them all
under Documentation/translations/.  There is currently no French
translation, though.

Starting a new translation is not a small effort; it requires a
significant commitment of time to keep up as the documentation evolves.
This is generally not a project that a single person can be expected to
sustain over a long period.  I do not want to discourage you too
severely, but I do want you to be aware that this would not be a
drive-by project.

"Automation of documentation generation" is a bit of a worrisome phrase
here.  Kernel documentation is for humans, and I don't see much value in
shoveling a lot of LLM output into the kernel tree.  If your plan is to
upstream a bunch of machine-generated translations, I would suggest
looking for another project.

Thanks,

jon

