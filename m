Return-Path: <linux-doc+bounces-81784-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC53Aiarymkx/AUAu9opvQ
	(envelope-from <linux-doc+bounces-81784-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 18:56:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F27A35F1DC
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 18:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7612300F9D5
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 16:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FB13DBD76;
	Mon, 30 Mar 2026 16:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FlqD1QtD"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F130F3DBD46;
	Mon, 30 Mar 2026 16:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889698; cv=none; b=HvBXz+tBohW06jy4ZMktuns6J7vDvYlGfjTggB3Ut+tvHjKzlNvjHqCKWhQIe94Dgdrqxish2cALVTW6j7vKG4vCWlQ1f9BKTRe8xgxR203h12lwzkdnr2D9VhNOadwDKOXh6nEaNN8n+C0OchqVZ/PUl9SOK9VDLU/+UoDyfNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889698; c=relaxed/simple;
	bh=ov/WoRW26M2AwC4rr0O7QpGz7iFLoJJjZlJAQtxWXFg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=maLa6SxmiL6wXvC4TNiYFv/RyV4BE0KRdFd6E4zva4Sn9t127iZAfUeEX8v0kdqwfO4OWM46jFbkUefgnnHtWxxqsRLis4L3y+h3hH3zh8TZvwajBdiOCHbuHKXs6jogO3QxeVchXsw/YETZ5YMnu0aD9ov7+05C2f2CIFDP4NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FlqD1QtD; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 56CA4411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774889696; bh=st0GCyNmUqSrcumcFUcGScUUX5IeHuS1bhaTnTv+nxU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FlqD1QtD5/S/fIrK+Fq14R8poKd3hQw0lC5e8JVAhO67gHK7eYXY6OJAiYO+2k3NP
	 ABPiSgnG/pyNoBh2J5Lxc8ffU9Nx1ZxgQuN4Gvyz7HXgrbZNXaZLOO9YorDtbPRQxD
	 yFXPSbPelcMPY7hcLQpEiRBl1gldnySkw2rw7OpbUb5pTpe8sKTz6n/O04TMBDya91
	 OpB9XbPRW++D7lRAnwnIZpiyDMppvLMf65Xp1m9DESU3xxU2xSAsb2yr0Zo3q05rZW
	 MWp6GNg4SINh6sjuOl+yHR4kDm0Z1ZqcdNWIl+ddhriQf90c6nF49jyi370tYrSABF
	 a28KCwNmJzE4g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 56CA4411C2;
	Mon, 30 Mar 2026 16:54:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 0/2] Add a script to check for kernel-doc regressions
In-Reply-To: <cover.1774551940.git.mchehab+huawei@kernel.org>
References: <cover.1774551940.git.mchehab+huawei@kernel.org>
Date: Mon, 30 Mar 2026 10:54:55 -0600
Message-ID: <87y0j9mf4w.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-81784-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4F27A35F1DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> I've using this script internally to check for regressions and
> changes with kernel-doc, specially those related to the new
> CTokenizer code:
>
> 	$ tools/docs/kdoc_diff --help
> 	usage: kdoc_diff [-h] [--full] [--regression] [--work-dir WORK_DIR] [--clean] commits [files ...]
>

I've applied these.  Haven't had a chance to play with it much, but it
looks to be useful.

Thanks,

jon

