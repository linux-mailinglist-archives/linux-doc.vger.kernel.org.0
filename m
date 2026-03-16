Return-Path: <linux-doc+bounces-79496-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG0QNd0cuGlYZAEAu9opvQ
	(envelope-from <linux-doc+bounces-79496-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 16:08:13 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D28029C046
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 16:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83069302513C
	for <lists+linux-doc@lfdr.de>; Mon, 16 Mar 2026 15:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB6239E166;
	Mon, 16 Mar 2026 15:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="E8l7JUDI"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2BC1386DA
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673570; cv=none; b=e23U6tF+8XMUhkIth5O9LJYXiqPM0+mtJx75GizkNtOxOjAeeT585YX+fCEuzIgTcgcHaqrx8De8AdSnre7OBx3III9ToAEu0tNpx7cMQ+zmeyezLYkc9hzEtufQYqDhlHaVuMSDQNceJacvoctaskeMQPsWIVGH69iQpVAJ1Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673570; c=relaxed/simple;
	bh=Ltk04OADJTCs9chVxsm0NzuzOhJQXzUEZn95j9D3/pw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l2mBn9PDhyM19bXo49eaVzx/rkffUTQvcZoyhJLsk9wknZi/fWmrllrKStJw8TazcA9af2RWX2ZKAR8BH4vg4qgx/sXFSvnJS3hF2F9fR9epJEOCyB9SsQDTqvuoJ/v9menhOJ/7BcENjsHsYWJtrWIs4IdNTlQiqhXfM3NRk/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=E8l7JUDI; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 35DF6411F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773673568; bh=HcoFzXqKGZ4VRsUqh4N3hkFYaxdhCFRCFiU1h19xJPQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=E8l7JUDI1f6yvu+pkh2/I8K3sWJ/9xBp565u1RQ73Z/RxP9mvn/L+GBVi0oomUVtG
	 G46+dbflomkdYax2uWBLoxPJxtEjEy3IsALd7H8Znt6UCdiya2WpCIlcKcF/HrqIx7
	 T63QjXI3HvjOg+UvMh1PVGMN82XSt6ZlBJPqZR24KmJ4A1+7SZa9CAa+EBSAt0y4yh
	 72ydQLOcQMtmvWtA/ZD5gtYdXsek3ClGmvd+qK2m9ITU/rCRBSoaJhhiuWfdm9rbNZ
	 akuRJLIivjMTWYpafuyQsvYqarif2AZ+QmCsk5AjtFVAFf1DvyMygGBfmdIfHDmj1Y
	 YuJsAhKCkeKow==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 35DF6411F8;
	Mon, 16 Mar 2026 15:06:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>
Cc: Kit Dallege <xaum.io@gmail.com>, akpm@linux-foundation.org,
 david@kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs/mm: document the OOM killer
In-Reply-To: <31744315-bf9e-4d9a-9c25-63eef0bd2f01@lucifer.local>
References: <20260314152518.100194-1-xaum.io@gmail.com>
 <fbee0ca1-4de6-4182-865b-a33d9ed32ee4@lucifer.local>
 <abeyD1ZngYhkAx6g@tiehlicka>
 <31744315-bf9e-4d9a-9c25-63eef0bd2f01@lucifer.local>
Date: Mon, 16 Mar 2026 09:06:07 -0600
Message-ID: <87bjgnizkw.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,kernel.org,kvack.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79496-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D28029C046
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"Lorenzo Stoakes (Oracle)" <ljs@kernel.org> writes:

> I wonder if some of us (I realise this sounds like self volunteering)
> should just write up some bare bones and patch it in, then we can get the
> iterating part of things moving?

That, of course, was the theory behind the addition of the skeleton
documentation that's there now :)

I have also thought about trying to fill it in once a bit of spare time
opens up.  Funny how that tends not to happen, but I still would like to
do that at some point.

Michal's question, though, is something that needs a good answer: who is
the audience for Documentation/mm/ ?  Some of the stuff in the patch
under discussion, if it were to reach an acceptable point, is probably
better placed in the admin guide.  OTOH, a manual firmly aimed at people
trying to understand the MM code itself makes sense to me.

Thanks,

jon

