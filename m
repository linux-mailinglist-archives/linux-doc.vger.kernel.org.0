Return-Path: <linux-doc+bounces-82593-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKwNLgIG1Gk9pwcAu9opvQ
	(envelope-from <linux-doc+bounces-82593-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Apr 2026 21:14:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 406B63A689C
	for <lists+linux-doc@lfdr.de>; Mon, 06 Apr 2026 21:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 904B2302304D
	for <lists+linux-doc@lfdr.de>; Mon,  6 Apr 2026 19:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCF0396B7A;
	Mon,  6 Apr 2026 19:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3YE90LM"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81B43947BE;
	Mon,  6 Apr 2026 19:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775502834; cv=none; b=WHobKgTJK95sIE5Yd2KNZRDwNKaJK91mbnfooJoXATCKd1Ewp+Dh9GYTKOxg7kdoTNpXsK9ZncR36kwETMtJtyeAdNAZUbxY/Rv/ytSeWsuM3EKztIZHACoztMeghxA6bv0jKvWYGOSFGbpIZsKJoZAZjgKDuYKOqSQSSZZXomc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775502834; c=relaxed/simple;
	bh=egab2ca7KCCYijspTaSqRj0rJHrHwi6eKKRGSBqNWk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjKAF1Xyyh+y1piiMY8iNXXzhAIssw+aK+FpsQsXBrMfJrPdXh+23PkMnoQ7s9ftSyaRhJLxxxD5/zpIIAll98JEOK2Z/7xCpROiLM+cxk/fMOqwpY8duudNDFXxp6FHWAijGtQYERosIw1/Nph7lWVpXbXXBzNkcob3j/sXQes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3YE90LM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31377C4CEF7;
	Mon,  6 Apr 2026 19:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775502834;
	bh=egab2ca7KCCYijspTaSqRj0rJHrHwi6eKKRGSBqNWk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3YE90LMmdc/bVt2JaBNgsPyYa8goqS0gL/8cAQSINPZIasLDQrbjYeW2epxTraVd
	 gwApJvCOsb0jTIMPb66sv1Ze+9Z650GuQqXfkfrzBycn37g6cqaeI6gd1FKsFnP/pK
	 GIvhzNCY3g2J1+sWheLnztaNBuzpqUKVhjG38hGPz9mXj9RPOGdjmvdNMc9PVkVxs0
	 QbXpGvrEAxL5y/MTeeU31U0KPyWvP4+5b/W9YldDwkHyu6nLeZZ2MK4JMJE4bVMLje
	 d3Me4oa63NRQe2JDKeWZ5pqp8MrIw7ecolX7ILe2X5vBUi9ZwcbT55dA84JaMd/doL
	 u4whyJUE/p/Ow==
Date: Mon, 6 Apr 2026 15:13:52 -0400
From: Sasha Levin <sashal@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, joe@perches.com,
	corbet@lwn.net, skhan@linuxfoundation.org, apw@canonical.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] checkpatch: add --json output mode
Message-ID: <adQF8LoUf4YH7F98@laps>
References: <20260406170039.4034716-1-sashal@kernel.org>
 <20260406-true-whippet-of-luck-d3c2ba@lemur>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260406-true-whippet-of-luck-d3c2ba@lemur>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-82593-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perches.com,lwn.net,linuxfoundation.org,canonical.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 406B63A689C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 03:00:25PM -0400, Konstantin Ryabitsev wrote:
>On Mon, Apr 06, 2026 at 01:00:39PM -0400, Sasha Levin wrote:
>> Add a --json flag to checkpatch.pl that emits structured JSON output,
>> making results machine-parseable for CI systems, IDE integrations, and
>> AI-assisted code review tools.
>>
>> The JSON output includes per-file totals (errors, warnings, checks,
>> lines) and an array of individual issues with structured fields for
>> level, type, message, file path, and line number.
>>
>> The --json flag is mutually exclusive with --terse and --emacs.
>> Normal text output behavior is completely unchanged when --json is
>> not specified.
>
>I see that it's writing json out manually, implementing its own escaping.
>While there are upsides to not requiring a perl json library, I think it's
>fair to expect that people who would want to get json output can probably make
>sure that JSON::XS is installed.
>
>Not a strong object, but seems cleaner that way.

No objection here, but from what I saw the checkpatch code only uses core perl
packages so I wanted to keep it that way.

-- 
Thanks,
Sasha

