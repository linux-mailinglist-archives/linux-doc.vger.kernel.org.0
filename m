Return-Path: <linux-doc+bounces-83054-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOZ1Obgp2Wm1mwgAu9opvQ
	(envelope-from <linux-doc+bounces-83054-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 18:47:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF8E3DAA7C
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 18:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD7663008D2C
	for <lists+linux-doc@lfdr.de>; Fri, 10 Apr 2026 16:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EFC3DE43F;
	Fri, 10 Apr 2026 16:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="X+/HAAKB"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24833DE455;
	Fri, 10 Apr 2026 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839504; cv=none; b=Oo5hFQZl2+/XCkDeb1htT0RHocudWCLUxeAodRlnt6RkjsDp+QFEMdBlf2TsALluS5AiygmrDZMMQk+obMa00mVyNOxdE6R1m2MuGLduQHryy+BMuOEjW2tMu3mJnErrGqHCNj3dg2mHwwWbO3eQMCFTUwXpUEOGKLYyoaqWqUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839504; c=relaxed/simple;
	bh=Al8UDX+St5+hqgrM8EeBh0NKgOL/Jg8MLyaqcX9lsn8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Et42QWRQTdZWWfqkt3TZB5qpP7d/KfTpQ7vwbZdD9Hth1TkJQIap1tlAK4Ai+iZDWBoxgoHO4Jb7WyVfXhXI5eX6S0o7bkFKM//aFU4h36ucPy4aehSlf5gIJ2skxmY8/Qls8cNOQfk6iJYvI/fGOQUzsJePofXZ6v5FT3s8XcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=X+/HAAKB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 008EC41089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775839502; bh=ryfHyibcOmhifIzQAzx51A3HClOr4issYgV53upqN1s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=X+/HAAKBGYxVQFyWOLBGsS3VYpCo/43KtllyzdvA9yDYtf16ukw+3ZKhLXwTrZAhf
	 DmiQbFKW25zD/UfRzVuc7L+idtlwwabj9++iqTO4a27HENcgR6mjwJ2dbfwkqdjE3p
	 UhLYn/Wfxiuy3ctwd1D0C6F9KsKGAu3t8VDtKTXKIzf8eMXhEZ/FlyidDIyro4gUXk
	 NFnHpexP4AhoReYcsbn1lGcTwusSG6vEWIrZD+bePkO1cqPqkopGYSNdCXP6yCDMx2
	 icp1fI0NgURI2NLKw4V1HFqyT4ZEbmk7YaNjROBnl79DEcQO3YZOcgY3VXWYSLxQXx
	 E8DP35fhAGmPQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 008EC41089;
	Fri, 10 Apr 2026 16:45:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Guenter Roeck <linux@roeck-us.net>, Sunny Patel <nueralspacetech@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-watchdog@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: Refactored watchdog old doc
In-Reply-To: <fe3de980-e918-47ae-862a-969a5b117ae0@roeck-us.net>
References: <132f7e64-4fc6-4274-a04e-e53f0b957665@roeck-us.net>
 <20260410072825.19114-1-nueralspacetech@gmail.com>
 <fe3de980-e918-47ae-862a-969a5b117ae0@roeck-us.net>
Date: Fri, 10 Apr 2026 10:45:01 -0600
Message-ID: <87ik9y229e.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83054-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[roeck-us.net,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: EFF8E3DAA7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Guenter Roeck <linux@roeck-us.net> writes:

> On Fri, Apr 10, 2026 at 12:58:11PM +0530, Sunny Patel wrote:
>> Good Point. So again revisited the watchdog core
>> api and list out the deprecated one and marked
>> as deprecated in doc and also mentioned it just
>> for legacy driver and not for newer one.
>> 
>> As someof the legacy driver still have reference 
>> to old api so just marked as deprecated in doc.
>> 
>> Also checked with other watchdog related api
>> which are deprecated in driver but still present 
>> in doc but didn't find any.
>> 
>> ---
>
> The above would show up as commit message, there is no change log, and
> this e-mail was sent as response to v1. And I can see that without even
> looking at the patch itself.
>
> That makes me wonder what Documentation/process/submitting-patches.rst
> is useful for. No one seems to bother reading it. We might as well
> just remove it.

It's good to point people at.

I do think it needs a serious rewrite to, among other things, turn it
into less of an intimidating tome.  On my list of things to do.  Now if
I could only buy a larger drive to hold that whole list...

jon

