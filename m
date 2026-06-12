Return-Path: <linux-doc+bounces-92176-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A1LeAxlcLGqDPwQAu9opvQ
	(envelope-from <linux-doc+bounces-92176-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:20:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 573CA67BF58
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:20:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=ruBKkg8u;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92176-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92176-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21B103201EA7
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29BD238B7B1;
	Fri, 12 Jun 2026 19:20:53 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC773793A9;
	Fri, 12 Jun 2026 19:20:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292053; cv=none; b=NdPP53brDMuzF01In8X41BJc+AXjK5zpg3TGJyTnP+bPtgR2NQsnKW1kZkKIWS+e2JTRBMuusgTQFMx33Y0ATAIZ97wEW3QT8lfCmWerTPRjVF804IyPM1noZV5st4NFhXcciRDzrjSY2wu0/4b6NmSVitZ2jX0Z3q+BCxBMnWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292053; c=relaxed/simple;
	bh=BJa17qIuJY4RG7VnuxZTBKCt7UpY8DhM4Xd6RHzIMzM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AaDeaIMMxOz87OnogJXsEsbWxc4zrRBUqlxwdhfvulOG18fYDoia23saaDlZtkl+tEP1ZT4rCx7T62Yc/094F2C2l6al0luINW9pu9oWivXfnqteUQ26yGFc8f0k+BPzTSY+QG4+3KBEF4T0lHo5AVJRXJZvmmVke949dosuWPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ruBKkg8u; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D6DAC410AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781292039; bh=MGMghaRsZ1QS+Ihmf72LLL5qYKRppPIOFD+FpKtXvZU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ruBKkg8uie6ntjpdaNfPlA0vfpSXl1RzRj2F7QkqF3b9ZLvAcQN8HrL6xRQMAd1wS
	 /LzIS5xLob0Z+pWdgutQnf3V3VhiPvNeNMTAxIO4XGf/qGNfaIjYzOJcZNL+jGiCzr
	 yWw6g3IzsxCW7pU+xSYvKmXNECh8uICwPqXDn9P81ol1pjz7xHHC3pPVN9HpRYtA9D
	 Ye4zQhnOyRM6F9HfElZRrIyLnqM4qLLhTZ+Sbo1eShhsdAXDND8uf9+5qUxaJQO3tV
	 PIlD+Sk7PilavGWRK1KbencW/3w6EwxcbnoNIdrUhzAB6Z7WKHpdzs5wWWjnV2qtat
	 zIFWLS4sc5NHA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D6DAC410AA;
	Fri, 12 Jun 2026 19:20:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, "open list:DOCUMENTATION PROCESS"
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH] Documentation: process: fix brackets
In-Reply-To: <20260611064311.117023-2-manuelebner@mailbox.org>
References: <20260611064311.117023-2-manuelebner@mailbox.org>
Date: Fri, 12 Jun 2026 13:20:37 -0600
Message-ID: <87ik7n7egq.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92176-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:skhan@linuxfoundation.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:email,trenco.lwn.net:mid,lwn.net:dkim,lwn.net:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 573CA67BF58

Manuel Ebner <manuelebner@mailbox.org> writes:

> Fix missing ')' and needless ')'
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
> This is the first patch of a 'series', but I won't send them together
> because I'm still producing the patches and it will take me a couple weeks.
>  Documentation/process/deprecated.rst     | 2 +-
>  Documentation/process/maintainer-soc.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon

