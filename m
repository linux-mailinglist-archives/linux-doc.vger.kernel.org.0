Return-Path: <linux-doc+bounces-96923-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jP+wJoVyV2rLOAEAu9opvQ
	(envelope-from <linux-doc+bounces-96923-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 13:44:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE275DAA7
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 13:44:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=mbVfi2wS;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96923-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-96923-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ECDA1301C5C6
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 11:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DBC43303A;
	Wed, 15 Jul 2026 11:43:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ED5448CE6
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 11:43:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115809; cv=none; b=GjeFlEj2P1N0jiMXefT2J8kcXHK96xE3hJu8s1svOkYV4XDQyFU3VrtddtLBFwrSxNaaDJYr+cw21m6+JyR9/xGmlYTbTraoX3kXXP6hRK9UlYewwRPyBVuobDPQ8mXxpOUevY8Aptdv0bxGbp+YOKfvkVlxiPgg4BNrBTYl/pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115809; c=relaxed/simple;
	bh=B4nAbuExddVSFXs3KbGUjfvDeU6rRPhZajLbSfwhCFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRYVVtszFO8qxY5d8JvCh3TzyeWuzy+gaJbrM1CPhh50AlS3dgQsDZE+zcHsqLs3F3l5toWdpfT+6hqvIZnD/n1ISNWtWOA/kreACk3DDx4wC03casgT7EQWANegKu79urCWnfTA24A5PaEGPs4yBrMNDxXlQFLrEOnpBTMBv1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=mbVfi2wS; arc=none smtp.client-ip=95.215.58.187
Date: Wed, 15 Jul 2026 19:43:12 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784115805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xu8jcAVhJq6aZukec8XlDpfwNQZQbT0X243BuYb572g=;
	b=mbVfi2wSKLnfNblRpMBKCPU68GJMJ4jse0AL+1bwebc19HHjALAB3tP6g9l5Iov+7l/o1Z
	VGo4QzGX5/wHTYe7xvSXgH3aeDMD0eMU5F3jpsOsHXXLjigijP43G8xlUOYkXWmu+rSVqG
	s21yfFeyZ4QYozLEPfiL5hQIdwZDN17JGSjrRmf0Y56UTnzFl0lIupYaNLc+k9jqQxU5aJ
	uJUg9ifggaJH6HbDNAnATQjqHq1+03mylNXfMyaPZvstsrHazPhUOpgZrScvJFkLH7cbBe
	13DJkcuTL0CnnJPasJkNXqG0fb9udFadfdxQiEaKdwD3AaIDe4rOJeyzVCdVyA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Akiyoshi Kurita <weibu@redadmin.org>
Subject: Re: [PATCH v2] docs/ja_JP: submitting-patches: Refine wording etc
 for "splitting changes" and later
Message-ID: <aldyUNbLWNhbEyfS@wyuan.org>
References: <20260715113616.94305-1-akiyks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715113616.94305-1-akiyks@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wyuan.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[wyuan.org:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akiyks@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:weibu@redadmin.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96923-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[wyuan.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,redadmin.org:email,wyuan.org:from_mime,wyuan.org:dkim,wyuan.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CAE275DAA7

On Wed, Jul 15, 2026 at 08:36:16PM +0900, Akira Yokosawa wrote:
> Resolve rough edges in translation text added since commit 61e4155c81d1
> ("docs/ja_JP: translate more of submitting-patches.rst").
> 
> As with commit 999084ee0b11 ("docs/ja_JP: submitting-patches: Amend
> "Describe your changes""), do the following tweaks:
> 
> - Rewording and rephrasing.
> - Suppress extra white spaces rendered before and after strong emphasis
>   in HTML and PDF by using espcaped spaces.
> - Provide translation words for "embargo", "word-wrap", "top-posting",
>   etc.
> - Rather than keep "interleaved replies", use only 「インライン返信」
>   ("inline reply"), which is a popular term in Japanese.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Akiyoshi Kurita <weibu@redadmin.org>
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Duplicated sign-off? ;-)

