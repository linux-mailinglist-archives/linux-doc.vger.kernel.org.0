Return-Path: <linux-doc+bounces-81490-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGpfO/rBxWnfBQUAu9opvQ
	(envelope-from <linux-doc+bounces-81490-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 00:32:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE1033D12C
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 00:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0D27304EF50
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 23:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD6C3A6F0A;
	Thu, 26 Mar 2026 23:27:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7180391846;
	Thu, 26 Mar 2026 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774567650; cv=none; b=CRF8D/MXMyLdH0BTPT7N2uW17yp3m7V99/DX5y+fSivNdkPipXhDeEa95RgFZ3qkSvC9HMox/D5OmZ3TwfXwRhwZNDprDyqK7vTmAb+sv61HmOITgX1FBm9Mb16MfFP2ZvVrdT9mEvRCdwPnqH7cB9ylF0cEPPxj0VGH26QYMS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774567650; c=relaxed/simple;
	bh=FQZZyFZbb8ECaPObx9BVQbMrnHpwBeZoLxCyoOrWPEw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Be7jxzghJ78hb8Ywc17GCMHvHnFj9kBfRmfL+SMxojC4/jruzcmQSDbDSxvSpQqwQw4XK4FaPvaAb6/bmhtL6OEFFmAyV1/u/T8r8DsbCQt0QK0RLjx0oLBOm/34mPEFe6oMfvVqcjlrMV7WNtf5dUy+Z+YYj7Nc5GcShcJ8Dao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 61563BB9A9;
	Thu, 26 Mar 2026 23:27:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id AE55A20023;
	Thu, 26 Mar 2026 23:27:25 +0000 (UTC)
Message-ID: <213b7ea370ba1aac2b55bde6990965941e41c2be.camel@perches.com>
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
From: Joe Perches <joe@perches.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton
	 <akpm@linux-foundation.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn	
 <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, Jonathan
 Corbet	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Mar 2026 16:27:24 -0700
In-Reply-To: <acW9KGbNm8bLg-cr@google.com>
References: <acTPXMJfkHLeItrK@google.com>
	 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
	 <acVIBseRrqJI8Uwb@google.com>
	 <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
	 <acWnbG3nGjfYeYXh@google.com>
	 <34318752a257b0f6b530eacf53d565de1ac84485.camel@perches.com>
	 <acW6Iar6XOzO9IfN@google.com>
	 <3217a61e50f7b9fd387b908c0907bd0bf889bebb.camel@perches.com>
	 <acW9KGbNm8bLg-cr@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: 7e9yudfg3mew8rd3545ec8wawzjmuw91
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18BHHZXI/+fKsg8wfDXgDIjPoi9ejVGwUg=
X-HE-Tag: 1774567645-813867
X-HE-Meta: U2FsdGVkX18B8l4cdSt1pRkWM36FHbJ2TYgU6ZcFei/YTOUtiA9B3z9iw8Qz9GdECiWZ9PoCQ7Jm4kQFy5ZfCPboULRTdO9NSsYF023P/PLsIlKmYOssCcBwiTJgnu3VvVmyOf6EP+AnZZ0+hR6zdALwBQ06CcrdLG5F/Otm3ryX9tcCjpcUKVGsbyDJ1A6sAsFkXsJe8L4U1ODrPwYURtPEplCP2TcDAeXuvnbhpWpQUoGkIL9veRfor05CYL7eU7oWDbzDNLgryHK307okmwUvnl+7BseBxOmL3of60MveqlbSmOKb4CJlIZ/o7F0Z
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,canonical.com,lwn.net,linuxfoundation.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-81490-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[perches.com];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6DE1033D12C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2026-03-26 at 16:19 -0700, Dmitry Torokhov wrote:
> On Thu, Mar 26, 2026 at 03:56:27PM -0700, Joe Perches wrote:
> I gave you feedback.  You elided it.
> > > Could you please point me to it? All I saw is "just save it"
> > Seems constructive to me.
> As constructive as "You're holding it wrong". I want to be able to run
> checkpatch as I am typing, not at some later time. My editor shows
> diagnostics as a virtual text, so it is quite confusing that the error
> is still shown even after I fixed the issue.
>=20
> It looks like I forgot to add akpm to CC, let me add him...

No worries.  nak.

It's not something I want to support.

cheers, Joe

