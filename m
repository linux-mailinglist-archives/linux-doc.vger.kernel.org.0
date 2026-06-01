Return-Path: <linux-doc+bounces-90375-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ8JMBXWHWq6fAkAu9opvQ
	(envelope-from <linux-doc+bounces-90375-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 20:57:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2539D624537
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 20:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DD5F300A8D9
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 18:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FAE3EDE5E;
	Mon,  1 Jun 2026 18:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DGGMT454"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB15A3ED3BF
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 18:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339476; cv=none; b=nvnSEktOlZerfwwyNvGOVVGZNFIoi/kgsvk/r0UUMt7dNqMgLoP6LUJVexBAM/IfCAkK2jkQKlJ7WFrHlI6CXZ4jxJ6sjZSkgTz8qAoyhVJAlzOgroYLpatconFki51Vjin2ggPXyhAFHH35R13a4tfMgOiCazC1m/QclAL97qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339476; c=relaxed/simple;
	bh=PAg+4af6kH0yE/K3bY/oZ4I3bzJZ0+qs0gXcVkVQs90=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J+HB4lss8W59PwAR8IE7wys5zaQMUi3nAQFocs/nZxLBGy3+Yn5Bp0s1vgG/I0IRcWTv7EtF0k5Yw1MY510jiC0R8pc1VXpOz0kRz7imSZRSkd9fImw76bD34Rwf21S5HvqjnkA8tHZ9FrnMAxunhv5w0dtddEK2VlLq2iqrPm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DGGMT454; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1574740E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780339473; bh=xrsazBiiOIxmRJqi25d9/XDpkUWRtrStXecnfY+Tusc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DGGMT4545fiw/b4Ux/y/lnd83HpWh6k7wV4DIv7hbG/wvx8dvTnaSZ0NW9Am71n6t
	 9XFO9tDI+2xSJaqLLYzblcqzAlEBcOr1ClwozhlXLpso4rR8uF6qEgRJ9FE1bK1mqF
	 RxXYHXZvrOshGSKPG8KnBvW4kqy/VRJOsj/9cjR5Jb2sHQ58DXFKazkBBl5KhwkwmO
	 R8W84MdBj7fZa2jCrMIe+huVdblkXLMtt7ZYOHz4UT+nDxGtYC6un/dOsuVZU4SUMv
	 VcMf6wYA9lgbZ6u5+aQbkAZYqu0fVrixtFoCSTGae2uH/QZOkA3vhgnMIgdNPt+dL2
	 CPZz9MTw7TU9A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1574740E50;
	Mon,  1 Jun 2026 18:44:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: add translation for kernel development
 process guides
In-Reply-To: <20260527155350.202569-1-danielmaraboo@gmail.com>
References: <20260527155350.202569-1-danielmaraboo@gmail.com>
Date: Mon, 01 Jun 2026 12:44:32 -0600
Message-ID: <87o6hu9k33.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90375-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,trenco.lwn.net:mid,lwn.net:dkim]
X-Rspamd-Queue-Id: 2539D624537
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Add the Brazilian Portuguese (pt_BR) translation for the
> 'development-process.rst' and '2.process.rst' files under
> the 'process/' directory.
>
> The main 'index.rst' file is also updated to include references
> to the newly translated documents in the toctree.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../translations/pt_BR/process/2.Process.rst  | 520 ++++++++++++++++++
>  .../pt_BR/process/development-process.rst     |  21 +
>  3 files changed, 542 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/2.Process.rst
>  create mode 100644 Documentation/translations/pt_BR/process/development-process.rst

Applied, thanks.

jon

