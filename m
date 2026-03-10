Return-Path: <linux-doc+bounces-78700-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNRJDJtPsGnFhgIAu9opvQ
	(envelope-from <linux-doc+bounces-78700-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 18:06:35 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 749902553B2
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 18:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2E3E311E486
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 17:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119293C65E5;
	Tue, 10 Mar 2026 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZ5/ht5m"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18FA28B7DA;
	Tue, 10 Mar 2026 17:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773162328; cv=none; b=Oz9dvn1pVS7pqAVXyOTtWgo3MwsfDrhhKPLNwhAViatAEZUQgGJxXpBQOrP/njSnp8cWseiNDtxr6GRUc7eqm7PYysCuMybbExrQ2iIbLbaJvdR7GzSDk+ALlnKTaaZ4l2UEOWbx9c1lPbla4VRjXOxAjgQ6SnjiMWrIDcwaJo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773162328; c=relaxed/simple;
	bh=8XCjPyMkbQAR6V06f2fG0uPF2MRjPbY71EQ3H3l08wc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=nW0C9Q0CKU+LHhYLKFESVnbNim66QSESUWmsqrje3oMFtGBf7JF2hflwet1+RKTH+Kl3pXKhq1I7covjJ47fXz7LVB6BhtpcFPRFEr230SiwJtdvCR3vRzwi5JlqVt1sQthm1U4/3p/tAHm8m+wAC9mW7C36QOwv01SAOTo59Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZ5/ht5m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696D5C19423;
	Tue, 10 Mar 2026 17:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773162327;
	bh=8XCjPyMkbQAR6V06f2fG0uPF2MRjPbY71EQ3H3l08wc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qZ5/ht5ms3Ah+oFoR/5B9Dny7+sVYRd64j9tx0UbyLTN5ydGYKcqcc8UYVYZmdo9h
	 JculUWPgrSWBRgcKDmNLF4ARZwFYnylvvX9A0HBBAlTivNHNUgng7HGNn6NY08A199
	 fPaNHAIfOE8WxNzV1SvFrHZeMyp5u9rC234fMx66Ak+fG2xlF02u2be/gaz/CKPGss
	 T4YRI2hNojcq7tcDO5umYTA2VlMfcFrzrWnBxOth6JQ/nHHaI4EeMwA53uCNFERGHk
	 Bx4LUhkAPLjF4+vNZT4IyHVTcylZU8ZeCZUFSusapGeLId7xjxCmhrQ5Fx9hicI94B
	 kh+RHV00suSWA==
Date: Tue, 10 Mar 2026 07:05:26 -1000
Message-ID: <1e1412049d60bec19363c3121b19fd48@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Tobias Schrammm <t.schramm@manjaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benson Leung <bleung@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 driver-core@lists.linux.dev,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 01/10] workqueue: devres: Add device-managed
 allocate workqueue
In-Reply-To: <9a9cb7f8-54cc-4c43-a5a0-f022394351eb@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
 <20260305-workqueue-devm-v2-1-66a38741c652@oss.qualcomm.com>
 <aapTSyrkqqZ8j_XL@slm.duckdns.org>
 <9a9cb7f8-54cc-4c43-a5a0-f022394351eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 749902553B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,lwn.net,gmail.com,manjaro.org,linux.intel.com,linaro.org,collabora.com,chromium.org,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-78700-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello,

Applied the first patch to a dedicated branch. Please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-7.1-devm-alloc-wq

Thanks.

--
tejun

