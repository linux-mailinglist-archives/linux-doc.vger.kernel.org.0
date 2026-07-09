Return-Path: <linux-doc+bounces-95863-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7/1pC7QDT2o1ZAIAu9opvQ
	(envelope-from <linux-doc+bounces-95863-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 04:13:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B83E272BDE6
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 04:13:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95863-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-95863-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 347FB301D4F3
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 02:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5F431F995;
	Thu,  9 Jul 2026 02:13:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCB831E853;
	Thu,  9 Jul 2026 02:13:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783563183; cv=none; b=Z51KUOTHjoZDgKkZG+O9lyt0oS3ohHPnkH0V2er1ZtyDzF7wtKMoSugEzExp9H+TmNFoHXPclbGCVbcYeXCE++67fQVBy5Zd2bAGPgeb/loEwlQYIbxq+fRqwDhJz/yg9WDEhEJTNT19CGMAYiRMmVxUtF73pf1KUCzmGYnirno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783563183; c=relaxed/simple;
	bh=bL2Iyf5eOHNNA/EfrPGSMYDxREk+FrgkB58KU6UgGBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tzJ+lKQ7s9gO8lMBQRycbZjKHjccVUWn9m1JX6C4sYMfchCy/neo1YQiVrVxXKhAc8qwWy51sFy4eyAcNr+20qyWDZKMagM275h0W4oSISUUcUunpCxT1nJvTXOm6X2w+dljpZy+mC6NqBZHUbmjx7Q0Ot46imErjyDvcOTZZ8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
X-UUID: b3fe583c7b3b11f1aa26b74ffac11d73-20260709
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:639ea853-0cf4-4b13-b477-2a48f1396c1e,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:59b95266b14f250c4d2e980b10088039,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|123|850|865|898,TC:nil,Cont
	ent:0|15|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b3fe583c7b3b11f1aa26b74ffac11d73-20260709
X-User: luoliang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <luoliang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1577074722; Thu, 09 Jul 2026 10:12:57 +0800
From: luoliang@kylinos.cn
To: Jonathan Corbet <corbet@lwn.net>
Cc: Lukasz Luba <lukasz.luba@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex Shi <alexs@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	linux-pm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/doc: Fix stale em_pd_energy() reference in sched-energy
Date: Thu,  9 Jul 2026 10:12:54 +0800
Message-Id: <20260709021254.2627347-1-luoliang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260707085335.2942128-1-luoliang@kylinos.cn>
References: <20260707085335.2942128-1-luoliang@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:lukasz.luba@arm.com,m:rafael@kernel.org,m:mingo@redhat.com,m:peterz@infradead.org,m:vincent.guittot@linaro.org,m:alexs@kernel.org,m:skhan@linuxfoundation.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:linux-pm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[kylinos.cn];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-95863-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[luoliang@kylinos.cn,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luoliang@kylinos.cn,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	R_DKIM_NA(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kylinos.cn:mid,kylinos.cn:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B83E272BDE6

Adding the EM and scheduler maintainers to the loop, since this patch
touches a name defined in the Energy Model framework and used by the
scheduler code.

No changes needed - just making sure the relevant subsystem people are
aware of this small doc fix. The referenced rename happened in:

  commit f0b5694791ce ("PM / EM: change name of em_pd_energy to em_cpu_energy")

Thanks.

