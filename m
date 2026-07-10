Return-Path: <linux-doc+bounces-96329-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y475GChMUWpGCAMAu9opvQ
	(envelope-from <linux-doc+bounces-96329-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:46:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA5073DEB1
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:46:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=CMdK2A4r;
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96329-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-96329-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C37DF3016832
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 19:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C8038C2DB;
	Fri, 10 Jul 2026 19:46:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D378377566;
	Fri, 10 Jul 2026 19:46:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712803; cv=none; b=iQmYGVttKlOSkMVsx/JkJHK7MYXMm960jQ/FPNGT0FerUJq+UZif3xfXnvVxXeqybrRb4Nk4LJZQBgXbcvh+/ANvYbqyOrOfDfjSwDnHjHxE4rkzzyvSyuikT1ZnUGCe6zXN7lAYnSGyUEUnQ+K338jU9Ce4l4G8BlybUDB5tms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712803; c=relaxed/simple;
	bh=7o81Ht/KRJIJTc4ZvDdABlqS1lYKVfBgKm4HusuhU9Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LeB7OP6F75hOGbMa6Ahfmo6trGI6SvlPfyNpjaddyG5eMF9geq1YWVzGYZbQtG0vkj6Z4/0tNfUKhlIQYZtAVIOp1AaRk/ZsOJiCyw5VUlSH2B30AWQmddALzKoPbo17TJLJpKzHawh6di8d9q0CBlqTlcXCN+5EDldQZB4fk48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CMdK2A4r; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 793BC4108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783712801; bh=Wi2UBGe+CRCK59ZrTnlwfSjJtNElSyxHhTNTPAYZ8iY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CMdK2A4r2u2ndQd5NOtHtUeIMNMM0xYWmJ6XVHmOvNjStQLhv2VHjWBQTx0SQtxHr
	 TuRimd5pvZ4ytKH6yBoKTZFjEScMM9EBqyXWHsZJxFGkNGQdfZGs5dJa0XLc2dxoSj
	 O+xKI37Cy9J0qMZZaLU7MUd/sUa5TYtjLZRpHzzxTyuyC2c9e3TAhCT0WtpmMUPeY8
	 NmXWEC9Bimt4OXc4geKn8Ki5JhQpgTOO5BQoIfwkqPIERPfXl8MdZH6H3gYTjZY5LW
	 XHitm5X83mhhgtxfRLxljQ0nOPKQtDqT6JvKqFxc9KydiyC42MdZtVmWpLmvBjP2/9
	 +sWwUZOj7pd6w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 793BC4108A;
	Fri, 10 Jul 2026 19:46:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akiyoshi Kurita
 <weibu@redadmin.org>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH -next] docs: submitting-patches: Fix section structure
 around DCO
In-Reply-To: <5f320260-5cb0-42cc-949a-c92404124618@gmail.com>
References: <5f320260-5cb0-42cc-949a-c92404124618@gmail.com>
Date: Fri, 10 Jul 2026 13:46:40 -0600
Message-ID: <87mrvyk4pr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96329-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akiyks@gmail.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:weibu@redadmin.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,redadmin.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDA5073DEB1

Akira Yokosawa <akiyks@gmail.com> writes:

> Commit 5903019b2a5e ("Documentation/SubmittingPatches: convert it to
> ReST markup") made "DCO 1.1" a subsection under the section "Sign your
> work - ...".  However, the DCO text is meant to be referenced in the
> section.
>
> Furthermore, in HTML and PDF docs, paragraphs following the DCO:
>
>     then you just add a line saying:
>
>         Signed-off-by: [...]
>
>     [...]
>     as it was propagated to the maintainers and ultimately to Linus, with
>     the first SoB entry signalling primary authorship of a single author.
>
> appear to belong to the DCO, rather than to "Sign your work - ..."
> where it should.
>
> In reST (and other documentation tools), once you start a subsection
> under a section, there is no way to go back to the section.
>
> Fix the section structure by making the DCO a literal block, with
> indent changes made in commit 5903019b2a5e reverted.
>
> While at it, fix the same issue at "Reviewer's statement of
> oversight".
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  Documentation/process/submitting-patches.rst | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Applied, thanks.

jon

