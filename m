Return-Path: <linux-doc+bounces-87192-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LHlLWBiA2pI5gEAu9opvQ
	(envelope-from <linux-doc+bounces-87192-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 19:24:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 381FF525C63
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 19:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 008E530AF08E
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 17:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3653D9689;
	Tue, 12 May 2026 17:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UdCJLYjd"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F573D5C12;
	Tue, 12 May 2026 17:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606505; cv=none; b=aisTdg2/Iww/umQ98BWYdfMUgeGKcjK6xYUkXY6S+q6TyIkCc9OxzEPq/RWADX2zu6JTNicN9YCTYVRmV6WEofPMMG6mpzlvjxKzYMRkgLjs5D1OVn5eElW5RXpfRePv1DItI4JLJnnEIjRrJWlFP28w7GQedH4O1rUmZAXCiOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606505; c=relaxed/simple;
	bh=NHoIVBHISkD+ML76V0We/tfWBlDFnnpS7vsuV0OwNVg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JE6ZnLSj86c0y9b2SFQDw9qorr5Ni5XXygJOk/QcOprSe+sMU179R+EwcGWbwTPTpRAtmV7fmBVBzGTYvQTWtt6rQC6Bpao2sH+UwwcFS1xQAvjo5+0tmkJbafQViKLWosZdwtcCWAafE7TFMSABgRmY33c++/o9SjkMhNn04Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UdCJLYjd; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6B550410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778606503; bh=EEK5OhCv+T+wi7tL3Y73Ck7vntq73OvRxQcZ0hh1AZY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UdCJLYjdxT4w5FMKBekVja77elADQVRFhW3z9a0tJaMiNny+fwcoTZP3Q6jC76RqR
	 xcyipuklznKkoaJNcABLpxkNbu2h/jA9YIk3apNkfQ8xEFSYfSESE/UjjToA0Ha/tt
	 /DX+N9BR1LpDWPI6DmtVBj/o586oPdiVuWUXh1QJQRVsRHx5SkfOGMOSfoeTmiEawy
	 FclrulUWZW0CBzWYxui18L6jSEhDo1j5v/eih4tZAk0lOdObsnJQ160PwnLR2dQsu6
	 rNA11K+JeiDpBOF80sMs0NP8iUpiOjRimcvOxzxYBSOxtBGRUJQS/O+o0WNQnLxHJo
	 /LLL8A38LYV+Q==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6B550410B5;
	Tue, 12 May 2026 17:21:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>, greg@kroah.com
Cc: Leon Romanovsky <leon@kernel.org>, skhan@linuxfoundation.org,
 security@kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 3/3] Documentation: security-bugs: clarify
 requirements for AI-assisted reports
In-Reply-To: <20260509094755.2838-4-w@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu> <20260509094755.2838-4-w@1wt.eu>
Date: Tue, 12 May 2026 11:21:42 -0600
Message-ID: <87se7wo861.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 381FF525C63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87192-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,1wt.eu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trenco.lwn.net:mid,linuxfoundation.org:email]
X-Rspamd-Action: no action

Willy Tarreau <w@1wt.eu> writes:

> AI tools are increasingly used to assist in bug discovery. While these
> tools can identify valid issues, reports that are submitted without
> manual verification often lack context, contain speculative impact
> assessments, or include unnecessary formatting. Such reports increase
> triage effort, waste maintainers' time and may be ignored.
>
> Reports where the reporter has verified the issue and the proposed fix
> typically meet quality standards. This documentation outlines specific
> requirements for length, formatting, and impact evaluation to reduce
> the effort needed to deal with these reports.
>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  Documentation/process/security-bugs.rst | 57 +++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)

One nit:

> +  * **Impact Evaluation**: Many AI-generated reports lack an understanding of
> +    the kernel's threat model and go to great lengths inventing theoretical
> +    consequences.

If only we had a shiny new document describing that threat model that we
could reference here... :)

Thanks,

jon

