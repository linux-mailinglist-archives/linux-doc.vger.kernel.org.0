Return-Path: <linux-doc+bounces-76644-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KcEN/THnGkwKQQAu9opvQ
	(envelope-from <linux-doc+bounces-76644-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 22:34:44 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A2017D9DB
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 22:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 593E43067A0F
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 21:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF82378D86;
	Mon, 23 Feb 2026 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="L157LcRL"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799B323E358;
	Mon, 23 Feb 2026 21:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771882451; cv=none; b=i1WJpWf13rpkO/6Fa+HNe1RnEa6FSuXKR4pd4HdawF8MTeRkM8lsd30cmsaJ8pGIjNaAcc2t9H+JEJJsN29lR67JgFrQgzzn1PyF7ACS6LVo/elpE2EIBjPq2AgWnrGpKnyedEcIOZBEzknis2qVLLqQJ74KBg3syHD/E5pHTTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771882451; c=relaxed/simple;
	bh=yW66PgtS7TMre9iYZz+uBZ0gFAxpvkrZNFy6mTKxGfQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JQR/5j2ZUn7Wtwqc5vmTWaU+fYONlSJO0uDv0iblth+SbZrOqkddwTZc2bhxvcXuxVKVLqMlvEyp0w9PnChYuNBXWBFiq1w7dtAk52t8pql+k+4XX/SQtsTxoC4+yTa3SQpfVgiFzalHjPTR41CadG9JBZ35IbOJK/3ZYCTz4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=L157LcRL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CC52940423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771882449; bh=yQ6eEVYkWITfriAUX0GJpHRcPOumgnFsSFkBjRLVNeQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L157LcRLHL/yOoYo7qeCHINg6d0cRNjzh/h4dIV5WAqpP00qKnRGNjfzT0vn88UcJ
	 QdEcTW9XqGNaZg5RgamoYBivN+hnAvp5TpFSHUWz955wApnsOJIdELUNunmXO/dIQd
	 aA2dB79wZ7oDAcoKvPPiJRqHSYxzwFaIJ+m4pQQkJLIIq4wp0h0bNyeTD5dCi5aSBn
	 6Ptsj9vUWSOhEutknFJPh7fXTgC/1usHZHcLZpqRFDz37nC6WNyBK1TOYHJ6wmVssH
	 CAdCfxeuEeTNIES/dOYJJSsfeGSw51OlMV0OcrMYza97IBYgSn/jlthphw9NqfcZ9o
	 QqWbh/ZFsPowA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CC52940423;
	Mon, 23 Feb 2026 21:34:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Steven Rostedt
 <rostedt@goodmis.org>, Tomas Glozar <tglozar@redhat.com>,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH v1] Documentation/rtla: Add hwnoise to main page
In-Reply-To: <20260215131249.33437-1-costa.shul@redhat.com>
References: <20260215131249.33437-1-costa.shul@redhat.com>
Date: Mon, 23 Feb 2026 14:34:09 -0700
Message-ID: <87v7fn401a.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76644-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40A2017D9DB
X-Rspamd-Action: no action

Costa Shulyupin <costa.shul@redhat.com> writes:

> Add hwnoise to the command list and SEE ALSO section.  The command list
> is ordered from low level to high level.
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/tools/rtla/rtla.rst | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied, thanks.

jon

