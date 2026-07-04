Return-Path: <linux-doc+bounces-94959-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yfl8Kt0kSWrgygAAu9opvQ
	(envelope-from <linux-doc+bounces-94959-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 04 Jul 2026 17:21:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D20DB707D32
	for <lists+linux-doc@lfdr.de>; Sat, 04 Jul 2026 17:21:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=ph6SSIIc;
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94959-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94959-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A59F3014134
	for <lists+linux-doc@lfdr.de>; Sat,  4 Jul 2026 15:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0163955E4;
	Sat,  4 Jul 2026 15:20:58 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E88C37107E
	for <linux-doc@vger.kernel.org>; Sat,  4 Jul 2026 15:20:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783178454; cv=none; b=F/pitBy9MM+VEahSzT4hQW/EeEKwyFgYIBJ7u8H/f04XJ3TmKIPe6K7ZrkHZjz7SheYSwP+soC78BMvRE9WYLNllVNT/CvH3W4fJxfsCjVaJHS7yzcsxHoDI+xIjzhbgZWBaJScQyQy4/0E1derHxcbwErtw3HCWXvySJChyvPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783178454; c=relaxed/simple;
	bh=Y6OjLgwf1hD05luU0nG9KnzaLwYq4nvYmDa16dD8Thc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rNfR+N46o4BAG0frF/MMAKuHf7vazcphAUl/JyDqKIQSUpDlRyvE6NviQ0mQxkJzy8zJZBUaW496Tgw8wektXPHmptsGhLUmN/qeOjRsY3nedVWg1dQRWkdrtPn0u2fACHYaFBzYh/42kSgSje6Ts8uVuiEbChZTvNUQpvmXsto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=ph6SSIIc; arc=none smtp.client-ip=91.218.175.183
Date: Sat, 4 Jul 2026 23:20:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783178444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=Y6OjLgwf1hD05luU0nG9KnzaLwYq4nvYmDa16dD8Thc=;
	b=ph6SSIIcNTkkN2sPqfEiFamn+YuBbcgQDC5f5/6WwIXVOGJQz0KfS4KcBnmq1N+nfyHRu8
	fYiaEBxkmjxcQMPbXw+aj3TjyhoeUpH3BH8/UrhW4fRgc1CYei31ZPinX2cE3tKnJouIeN
	ALkTFZ2Qx0ES9qelQnfAI7u4HumkvmTYFJsUquV1iRT4rDMLhsoGwC8v5w8QTxnzlncS7t
	4tfC+Y7CPTI1qUwz0GQ+xy0f29hnPIouaD/EZtKJeLUTs/MYvWNWfhJeo2CAoaU4y0vVnI
	gVWUAsUGHdqcCfT5sLWEw7dQrsXCpLYW+jtIFGyj/ax/OPmDfGDDPDe74tt3vg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Yan Zhu <zhuyan2015@qq.com>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, mic@digikod.net,
	dzm91@hust.edu.cn, skhan@linuxfoundation.org, gnoack@google.com,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH 01/10] docs/zh_CN: add LSM/index Chinese translation
Message-ID: <akkkxFku6Jzx6Cjf@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781105672.git.zhuyan2015@qq.com>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wyuan.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[wyuan.org:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94959-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhuyan2015@qq.com,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:corbet@lwn.net,m:mic@digikod.net,m:dzm91@hust.edu.cn,m:skhan@linuxfoundation.org,m:gnoack@google.com,m:linux-doc@vger.kernel.org,m:linux-security-module@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[qq.com];
	FORGED_SENDER(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[wyuan.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D20DB707D32

Hi Zhu Yan,

By the way, I could not find the cover letter (the mail I am replying
to) on lore.kernel.org. It seems to be missing there.

