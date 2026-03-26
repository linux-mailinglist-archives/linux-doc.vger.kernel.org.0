Return-Path: <linux-doc+bounces-81315-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LHdAPv3xGmC5QQAu9opvQ
	(envelope-from <linux-doc+bounces-81315-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 10:10:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9419B331F7B
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 10:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C0213013A9C
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 08:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D4F3B0AC9;
	Thu, 26 Mar 2026 08:46:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954E925776;
	Thu, 26 Mar 2026 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514815; cv=none; b=c9YvvYwjAuzSgIimfazumVdYpbjzPVP3QZuKcWbPm+p2A/B/eaZYg5EDyChAPv/PUWHSlUeNg5N5y4R6ECfz3KDcad6LZXHMyuo6ivQvWT3E1APMvvYYj8gQMmCxbDyFpIPhTq0IHzASJMe78F5pFEPyjXBO4FdA1R92pHiXFWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514815; c=relaxed/simple;
	bh=28x2Z0y5SxzWoHFh4GPWVrmyi25ie2jkjgA/cpSn3Ug=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AKeeFx5ChdWeaw7FvWFjL9JK+m3g2SKDbCy69AmHC0ZUH2UlZ+qjPlTQWKtC96HvyTxbJCMP5DqhVqb120CvyH+4kBpMKESncMmh+jNgT3kkKfj5L/gg4SbE9mg7tTuFCi2d30gM+Tv46UVJgM5H3L0AljcNPdeFJP9urirHKA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id E409F5B8E5;
	Thu, 26 Mar 2026 08:46:52 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 569241A;
	Thu, 26 Mar 2026 08:46:50 +0000 (UTC)
Message-ID: <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
From: Joe Perches <joe@perches.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Dwaipayan Ray
	 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andy
 Whitcroft <apw@canonical.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, 	workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Thu, 26 Mar 2026 01:46:49 -0700
In-Reply-To: <acTPXMJfkHLeItrK@google.com>
References: <acTPXMJfkHLeItrK@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: 8w5r5dxhuxow4x46zrht5ni4tefh1reg
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+rWZ2HbPnD9UiQsnSJ0r0hgNGXqzpa9WY=
X-HE-Tag: 1774514810-249581
X-HE-Meta: U2FsdGVkX1/xQ+Tt5ghHWe4IuwPyO7C8y1CBlDSnpUm+JkgbX3+t/A6xiffKjVA3pij619aBbf6P3UW1xFKIkYIM9BDrvKZSehQscw4RKdwx6ytbP2QMVi06+IpzxpYht7uNYk9R1F1zuUmJ85sYUckfyfkdBIfE+FBb/OIdaeszAyZY2eaeoK9jbFhWUHUaF/nmL93xtXl/F1XOIZzG9w+w6KkQSxOm0mprYwavYfUb1vcY2AQqPg6MS8NI7XJRXixbUtNZ/rTS48Hz7WutcL64sz/B+IAKpzPVNM8v3eFTxLEcowvR2ESuzAwbAeVo
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81315-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[perches.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_TO(0.00)[gmail.com,canonical.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,linux-doc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[perches.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9419B331F7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 2026-03-25 at 23:20 -0700, Dmitry Torokhov wrote:
> checkpatch does not handle full files well when they are passed on
> stdin, because it does not know how to treat the text, and whether it is
> a C file, or a DTS file, or something else, and so it assumes that when
> it works with stdin it should be a unified diff. For full files it
> expects to have a file name as an argument and read the contents from
> disk. Unfortunately this does not well when trying to use checkpatch as
> an online linter and feed it contents of an editor buffer that have not
> made it to the disk yet.

Why is this useful?
Why not save the buffer and then feed the file?

