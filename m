Return-Path: <linux-doc+bounces-80628-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAS3MhIFwWlUPgQAu9opvQ
	(envelope-from <linux-doc+bounces-80628-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 10:17:06 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A15E2EED6F
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 10:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55DC53055119
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 09:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6159C386564;
	Mon, 23 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSc3LCPD"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223D538645D;
	Mon, 23 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257059; cv=none; b=lTuJAiTxKYvdWhV36cHz779uQ7dCqAEi8YOy/q1VMfNQeWy7P/KsrOt5jadlkIAr6zR7e9Kd18vJyibl/9XBMqRzXEzAYQ42YHAXGgtC2w3CFe3j12c+IcPYrD5je14nf7EHK+iFD2xbMM/6lJRMMUYPtqcBr8s4798eYD7vWHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257059; c=relaxed/simple;
	bh=sE2ufwJ3Rjh+ZZYr6fE4OW6hNDnKOem4oD9XoiJcCV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=liVQGwhLVYQwJh9eRImDPRIgagy30zsBj1VdI5GXdnkxylMwTmldJQ1iS6Uph5VGgQjfELBEmxXKnoAen4GBWOE8rhXKP+MBW0j2+cNHnm8WV+MswUYmudXh3UL+3UPx+od1BpZ8X18tgB6Bxg/LBFjNAg5rJ+20zuFHQVnClb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSc3LCPD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D250EC4AF0B;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774257058;
	bh=sE2ufwJ3Rjh+ZZYr6fE4OW6hNDnKOem4oD9XoiJcCV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LSc3LCPD3bWS00aQpjhk9KQ+0TmI8JFotory9D2S2RKWnH+2KWxklnwXbk3n7BWuX
	 IqwDnC1Am8kiaFrYsccrHHa4yfqY+vBiFUiVGn8zHC09hwXad7EyBV0kBxsxHnu8lE
	 p0Gu7ifW6SyD6Ui1kyHadGLv6ZG+RiGygJxjvBH+h/dJwZq8zqTsA9G5lYsif3tp+0
	 2Hlc08rToxLnzzx/QrzagBA5FF09Zhc8GGej/iY/McMG4FwVmZBA+PzBW/5pUzXiBB
	 sQnWCn7Y9/TjRjr0n++q76iHdFHAm8wUYtwr6XTKxUsAEfDE0VBeEbUrLhkZ2rVzVz
	 kZw/KCFSMY2iQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w4bJI-00000002yWQ-1pgH;
	Mon, 23 Mar 2026 10:10:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 03/10] docs: tools: include kdoc_yaml_file at documentation
Date: Mon, 23 Mar 2026 10:10:46 +0100
Message-ID: <32b86abe7acee2dd4f73a35836ec94e8690f04cd.1774256269.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774256269.git.mchehab+huawei@kernel.org>
References: <cover.1774256269.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80628-lists,linux-doc=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.30.226.201:received,100.90.174.1:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A15E2EED6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an autodoc entry for the new kdoc_yaml_file module.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/tools/kdoc_ancillary.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/tools/kdoc_ancillary.rst b/Documentation/tools/kdoc_ancillary.rst
index 85f3806a431a..249753744d11 100644
--- a/Documentation/tools/kdoc_ancillary.rst
+++ b/Documentation/tools/kdoc_ancillary.rst
@@ -53,3 +53,11 @@ Python version ancillary methods
    :members:
    :show-inheritance:
    :undoc-members:
+
+Write output on YAML file
+=========================
+
+.. automodule:: lib.python.kdoc.kdoc_yaml_file
+   :members:
+   :show-inheritance:
+   :undoc-members:
-- 
2.53.0


