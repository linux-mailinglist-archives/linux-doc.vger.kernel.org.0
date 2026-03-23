Return-Path: <linux-doc+bounces-80768-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHISAPCFwWn+TgQAu9opvQ
	(envelope-from <linux-doc+bounces-80768-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 19:26:56 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 938112FB434
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 19:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE0D2300E583
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 18:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D823BFE4A;
	Mon, 23 Mar 2026 18:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="em8loEM9"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC38C3C65F8;
	Mon, 23 Mar 2026 18:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774290412; cv=none; b=WQtHpFt/BPvK44tdWFs48HpKhBw3sDG40uXbNGHULh6QirYfpH3fC1wT+5ECniEhnRf/PMR96kPCf6hm7Pk7gqVUy2k1J6NsirRz4g+a3iqcdCn7ozHY1Y0l5fy2uRkv1GOSYdBB5xBVoZ2YkHQWi67n0ioRHmn6vNf1ZrvnZp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774290412; c=relaxed/simple;
	bh=ctxhL0EoDIes4yhQ0DlWROBqUDiwuTeaGzz8/lYlqJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tSgE5y8UNljZNkSXnOhUY2iPUqSPjXLBgLTX9cYxkZP4CKxS4NChXV70djt9Xfpj7PSyZfFVyDgUtTFLbN09Lz4F/EtX5L5ohpr02By1kW66oJPsVMPJzvr1ZoBSJ7bfLHzr6ekgmFW6XImR97oG7gJFUuiSakaCe6HdytHsDaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=em8loEM9; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 332A24121A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774290401; bh=1U75Mitxew/7je1vOC7vprzgj72LdNa+mUKxpq5rUTI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=em8loEM9jWdj3PJVtjRTgN3/RsizjcMX303j6ocPIJIbd3HRN/GJJc6B6cMReTCWj
	 9QeMS72ZVHSef4aNzFc3ITTsaudH2TvnOZ+IKt1MgceimQb/SqPE0eMYXxUi+5LnwN
	 hmrX/uTe16ii9vlaFmLYqYvqzBhNeJKbf5N/U7nDTnex6kUwqIw5nlq1HJ3vBmmeny
	 LoHHf2hgCfJPbujJwtYrIw0nBBN/prCUW7yWpQd7C3uoYYLWy7/22ZQI+kmFB+PUZr
	 MSfScCZhByM6aRgh+NwdUjhoVinI4ERKcrcRajhmmjGfPQvP2ZuO9nmSd/NIv+bJCs
	 /4ocLKrGsvy+w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 332A24121A;
	Mon, 23 Mar 2026 18:26:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Rito Rhymes <rito@ritovision.com>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: set canonical base URL for HTML output
In-Reply-To: <DHACYJK8P7RN.MUHEBN0UC0LK@ritovision.com>
References: <20260321124907.8524-1-rito@ritovision.com>
 <87zf3zd2cs.fsf@trenco.lwn.net> <DHACYJK8P7RN.MUHEBN0UC0LK@ritovision.com>
Date: Mon, 23 Mar 2026 12:26:40 -0600
Message-ID: <87y0ji9zbz.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80768-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 938112FB434
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"Rito Rhymes" <rito@ritovision.com> writes:

> The documentation site appears agnostic toward search engine
> indexing because it neither opts out of indexed search for
> compliant crawlers nor explicitly adds directives aimed at
> optimizing for it. By being on the open web and not opting out,
> it by default participates in the indexed web as a valid and standard
> distribution surface for documentation. In that context, if
> the site is part of the indexed web whether or not it actively
> courts it, then using a low-cost standard signal like a canonical
> URL is simply part of managing that reality responsibly.

This sounds like perhaps an argument for lore.kernel.org to set this
variable for its build; I think a reasonable case could be made for
that.  I think that the case for everybody else's build is rather
weaker. 

>
>> ...and how does it help all of the people who do their
>> own docs builds?
>
> You accepted the favicon fix earlier but you could argue something
> similar about it:
>
> "After someone downloads the Linux repo and runs the documentation
> site locally, how does having the little logo visible in the browser
> help them? Without it, will they not know they are viewing the Linux
> documentation site?"

Even a little penguin when viewing a locally generated file seems better
than nothing.  It has little to do with the web itself, and absolutely
nothing to do with one specific web site.

Thanks,

jon

