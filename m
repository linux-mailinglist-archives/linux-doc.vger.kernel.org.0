Return-Path: <linux-doc+bounces-96004-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P8vTLefBT2q7nwIAu9opvQ
	(envelope-from <linux-doc+bounces-96004-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 17:44:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FFA7330EE
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 17:44:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=hBQqDe+I;
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96004-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-96004-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23A373099D06
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 15:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5178837DADE;
	Thu,  9 Jul 2026 15:27:05 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1D237F721
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 15:26:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610824; cv=none; b=rNc4XKxTor/Y+wLCjVXu7SEI1LuUo88eoVZN2v5OBPiWAIzdIBoJxOs7DYMSmLN6JZmOy567G9iXeHYcjHDxeVQ3skRT8/y0IKzKJ4y0ZkY1D2TFnxZehNmbLCLa+sNl8t1jnxzUgpJ0mmDgbjkU1JqLFg9nqINf9swVbJUP7uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610824; c=relaxed/simple;
	bh=/7gWABiz3usncEzH9N58qfQfv73wsN7IXAidQfk0Z6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LlPoVaE+wBqpuQwiaZixfMLarhSMmhESFm23yuvRLEOyuCUOz3h4AinNjo8Qnag8m6JODeYZYbUzKnLChdKw+cHsHS8qLseKADbQ44UxNu2Kt4V1LtQN5V8YXW/Pdg9dPcke97NOCA+xRAcrcR53AkD7gRXMrEAgRIHv/Sqb0oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=hBQqDe+I; arc=none smtp.client-ip=91.218.175.179
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783610801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PLQs8YTVcD6fvu2d36jJZ5mY0k2anIDnOU3cDbCFiRI=;
	b=hBQqDe+IyifV2IU+EcVtbDyUJ2l7KjVk/TUzl9t03E03nrWpZZOouQJPSSOjQNtnWccDfr
	ft7nefg4iytUznbvbVx1BJNasnyo+5rR5JeW1c+Hn1mDaId9PpFTeL+yYEdAPw2BzT5G7a
	wEjQe8T+lFvQKjUkDJg7yHFtmvHRB3Z7tT3OdfI8IdUkUxbv8xhyfENU6EEGixCsT0yDUi
	qV93NGzGVddAOR2mOv9VpfTNDKRS05zV8BY68HfGUQPL042sGvvp5toVkdKFhWRPlKIfc3
	AaypxpN/+sVQ6VRY8cDQW7RpFKOL9jStr4XK3oo1JB2nIrGHB5L16RspprpO7w==
From: Weijie Yuan <wy@wyuan.org>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Weijie Yuan <wy@wyuan.org>
Subject: [PATCH] docs/zh_CN: add docs-next checkout workaround
Date: Thu,  9 Jul 2026 23:25:29 +0800
Message-ID: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[wyuan.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[wyuan.org:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96004-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:wy@wyuan.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[wyuan.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,hust.edu.cn:url,tsinghua.edu.cn:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0FFA7330EE

Hi all,

Since cloning Alex Shi's tree from the HUST mirror may be unstable, as
reported in [1]. I think adding one more option for beginners to get
started might be a good idea.

Thanks,
Weijie

[1] https://lore.kernel.org/linux-doc/4292BADB2022F3A5+5117009.JcJflTAXpt@anka-vmware20-1/

--- >8 ---

The Chinese documentation guide asks contributors to base their work on
the docs-next branch of Alex Shi's tree. However, cloning that tree from
git.kernel.org or mirrors.hust.edu.cn may fail in some network
environments.

Document an alternative workflow: clone Linus Torvalds' tree from a
local mirror, add Alex Shi's tree as another remote, fetch docs-next
from it, and then create a local branch that tracks alexs/docs-next.

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 Documentation/translations/zh_CN/how-to.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
index 9ec2384e1e76..fcfe0a4a8be2 100644
--- a/Documentation/translations/zh_CN/how-to.rst
+++ b/Documentation/translations/zh_CN/how-to.rst
@@ -53,6 +53,16 @@ Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了
 这是 Alex 开发树的镜像库，每两个小时同步一次上游。如果您了解到更快的 mirror，
 请随时 **添加** 。
 
+或者::
+
+	git clone https://mirrors.tuna.tsinghua.edu.cn/git/linux.git
+	cd linux
+	git remote add alexs https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/
+	git fetch alexs docs-next:refs/remotes/alexs/docs-next
+	git switch -c docs-next --track alexs/docs-next
+
+这将先用清华源拉取 Linus Torvalds 的开发树，再增量下载中文开发分支中的内容。
+
 命令执行完毕后，您会在当前目录下得到一个 linux 目录，该目录就是您之后的工作
 仓库，请把它放在一个稳妥的位置。
 
-- 
2.55.0.795.g602f6c329a


