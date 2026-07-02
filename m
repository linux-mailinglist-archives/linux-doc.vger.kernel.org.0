Return-Path: <linux-doc+bounces-94535-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Me40Md4fRmqEKQsAu9opvQ
	(envelope-from <linux-doc+bounces-94535-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 10:22:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA86F4BF1
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 10:22:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=xs4all.nl header.s=xs4all01 header.b=uSQcwH7Y;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94535-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94535-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=xs4all.nl;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB34D305E99E
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 08:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007B441C307;
	Thu,  2 Jul 2026 08:12:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925B4413D8F
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 08:12:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979958; cv=none; b=ZrRIMX6J5GdqHX65fGPY0+Kit0uuSc855nNMpgxTf4GDW1sW3woGm06zG29YX3Ab8Oh9Sfy7uMWnsikgrdz5o704suFiL8meWIVuHPrNzkuhZZKZNugp1T2jIZtGlpaHKvtcX738mnsSV1LplmAnkNJh46w00Yq3RsbqHsCsIrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979958; c=relaxed/simple;
	bh=b7S2WtKCuyL2SY4ChUbBkrjwDmwLzR5+Q+azfdS//ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aw8ywVJaaQ3qrmIhDh64dqAclvTGI0TCTbjybOkrGh+76qfW8KuuxD3VIOJnag7a3pMnM2EqJXIHZC3cwVYtIrLKzs/J2/5hkbLCJF3ougdBjRmDbtVvXkjniWwz+iZ4LdNcfnZdXY2ZWXRCCYOOENNwJ7prtNi6xT8uJ7qXRFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=uSQcwH7Y; arc=none smtp.client-ip=195.121.94.169
X-KPN-MessageId: c3eeeb4d-75ed-11f1-a055-005056abad63
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id c3eeeb4d-75ed-11f1-a055-005056abad63;
	Thu, 02 Jul 2026 10:12:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:message-id:subject:to:from:date;
	bh=b7S2WtKCuyL2SY4ChUbBkrjwDmwLzR5+Q+azfdS//ns=;
	b=uSQcwH7Y6U+UIvmWHRGBKbgfnlX0kg6+VyBs1qgszOnOJVtY6TFscBrcpAh/PBIIAO9u0nRbNpOoY
	 xYQ9wPL/XSxUi/jmhDEm4cv2jzinuGCqVHRXge/u1TxAx9jVOh7mL6AZ83SQsu0cNyMZizFqzbuUjz
	 te+Katmr7Jazc3qnLS7cffzmW0FWOjMvDo5fhgJb7DfO1MTkm21OoP3wFsV1yEpakNe53oL6OB79lW
	 ifyT3KZK8gRRePd+cFpys2zRBPxk+FUsYz0Av+sRfJ3hSfsTtn5Y5LosphpHgh/PMU1YR9orK6hUDd
	 lnZm1jEuYiwuQuVTQAfFKoeSitMZ4CQ==
X-KPN-MID: 33|fGYeMdDgb81bwI7av/4nPvIK/sksPhYSrieixk58bIFNcx/ZsH5ZKWuSDwKiVms
 E2SqGv//Cy+Y5aNFx3dXNpy9QwWjNsXxVAhU9oR00fpc=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|o/mo+Fglpk8M3lg+1zS0b+FAKSbM93lmJALGh8ieaoJgfTmZtyVdornSCGgW24k
 66Ada7NCfjSYuanJ71cMpYQ==
Received: from localhost (unknown [178.226.150.234])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id c3858243-75ed-11f1-91c6-005056ab1411;
	Thu, 02 Jul 2026 10:12:27 +0200 (CEST)
Date: Thu, 2 Jul 2026 10:12:21 +0200
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, 
	David Hildenbrand <david@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH RFC] coding-assistants: simplify attribution
Message-ID: <akYasD1ckWcH1C0g@lt-jori.localdomain>
Mail-Followup-To: Jori Koolstra <jkoolstra@xs4all.nl>, 
	Christian Brauner <brauner@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, 
	David Hildenbrand <david@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-work-coding-assistants-v1-1-a20a94d1d606@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[xs4all.nl,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[xs4all.nl:s=xs4all01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94535-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:torvalds@linux-foundation.org,m:corbet@lwn.net,m:axboe@kernel.dk,m:david@kernel.org,m:jlayton@kernel.org,m:vbabka@kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jkoolstra@xs4all.nl,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[xs4all.nl:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[xs4all.nl];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jkoolstra@xs4all.nl,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,xs4all.nl:dkim,xs4all.nl:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,lt-jori.localdomain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7DA86F4BF1

Ah, I still reigniting this discussion again :)

What about a combination of what David and Jeff say? The whole point
seems to me that the salient information is not that an LLM was used (or
are we going to tag Sashiko as well or any other LLM-based code review
tool?), but what is was used to do. This information may be relevant for
how the review is approached. The latter should perhaps only be in the
cover letter and then we can drop the assisted-by tags altogether.

The question about enforcement remains.

