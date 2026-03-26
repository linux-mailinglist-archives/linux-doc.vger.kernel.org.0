Return-Path: <linux-doc+bounces-81488-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIWRAcfAxWlnBQUAu9opvQ
	(envelope-from <linux-doc+bounces-81488-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 00:27:03 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5725E33D08D
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 00:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6681B30490D4
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 23:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7652D399023;
	Thu, 26 Mar 2026 23:19:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DA6396D3C;
	Thu, 26 Mar 2026 23:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774567179; cv=none; b=Njj1UPCwaR2/Uj1y/ylUwtVpl6Exo9Wb5xzw4dvSvWpFCm/Pmw/0YfWu1WiSFkkxl7YkByz0vOTBrlwilv43rQd8xjQ+oBP5pQzbWny2ruCmJn1nNF0hh8LDStk4HCQPrOVSOD7Tjs2Q7f/8vsVAFqoPGX9CYU5FogtT4tRw3Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774567179; c=relaxed/simple;
	bh=ZU2DA/tIADtmJ9iDY7kACku+lkghNuYsUpyiO11uZPA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HpxXF238CBPJ7n0DO4z1SHqW0aGuXOBtlmwE+H9af6SxSzz6+qL923GJ9FSnAN+z6v6vi0ohPXvGv63Km7KF7NE7RcKlPiC4h8Lgd4ynO/M8YQRXzxztvh2ZtzVP/wAVSYglVFZqsii2F2djoSoBDLU5c1YtTjPiEQr03oKRYT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id E3E70BE0C3;
	Thu, 26 Mar 2026 23:19:36 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 60F251B;
	Thu, 26 Mar 2026 23:19:34 +0000 (UTC)
Message-ID: <f4dcaecb682c4eaa271abfee27c7cc8f6fbf7d1d.camel@perches.com>
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
From: Joe Perches <joe@perches.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn	
 <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, Jonathan
 Corbet	 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Mar 2026 16:19:33 -0700
In-Reply-To: <acW6Iar6XOzO9IfN@google.com>
References: <acTPXMJfkHLeItrK@google.com>
	 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
	 <acVIBseRrqJI8Uwb@google.com>
	 <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
	 <acWnbG3nGjfYeYXh@google.com>
	 <34318752a257b0f6b530eacf53d565de1ac84485.camel@perches.com>
	 <acW6Iar6XOzO9IfN@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: ccyc7r363mikui9x1hwnenrhm89knzxr
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19/RfCkIKw8kZnQ9+124Pmo1/tnKyi0lZA=
X-HE-Tag: 1774567174-818862
X-HE-Meta: U2FsdGVkX18XsI7K9FGwJOVRXpeDY4HaeIECt2u7/ThtTvW4hbIvmPPmecAhY5BiXEVSNHzjLLOPphG3UOVuC2dh9URHzg5SimM7z686JgjQe6G7WV9hJ0jqScUGpsaizrSlbaM1yyVpLWpCjJaqQYBB6vOfu0TZNhg/vzVKYKbxkWhq3nFH/Nj9EjV0nnJAsULTc1rr6JHKL+nDzyleyi8YnMD7QHhQ+7Y8SMSZvTwlcvfh3JswI4L9W1yv/1euc0ahGFlze/j0ci6laUtTA0foVLxam8fn3Lc8L90ubEg1CduwfinTcDrMqToqV6VW
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,canonical.com,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81488-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DMARC_NA(0.00)[perches.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,linux-doc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5725E33D08D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2026-03-26 at 16:04 -0700, Dmitry Torokhov wrote:
> In all seriousness, if you will not make use of this mode it's fine. But
> it allows keeping the source cleaner as one makes edits, so why not
> enable this?

Unnecessary complication.

