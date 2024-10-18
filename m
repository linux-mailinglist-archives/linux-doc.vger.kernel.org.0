Return-Path: <linux-doc+bounces-27981-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD6B9A4499
	for <lists+linux-doc@lfdr.de>; Fri, 18 Oct 2024 19:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 189711C22C11
	for <lists+linux-doc@lfdr.de>; Fri, 18 Oct 2024 17:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2170E2036F0;
	Fri, 18 Oct 2024 17:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G2LkS8T+"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90789202F85
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 17:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729272596; cv=none; b=LoXuYLua65Rqq1DYAOv577tcrnudN2z7hzi/Sxyl+VzKeUhViXRfZSbXib4Ab6vmVpAR2S5CKzoA01/KK3yIh+I1IlWaFAuZ9DGE0tkeOaIfIP7J9xLWCPLHhcwSBthfi2JyZbfaL6mJ1ePWc48gknp9XSdb+qBGvNBJsurtQAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729272596; c=relaxed/simple;
	bh=6xzFzO3G/41wII3sYX7hc4hgv8QHCwSwmGy8vXa5Jmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QP3Z9H6zVijyDdHAjjeB5LwOfUrFCXmvemz8QUgBwjGMHZ/c+gvXjPQEWPI016tTXKWD9Z271XbjVGco8uKDTB9eGuQ+fgGdO/gvk501pkvL4IxmAFmxwC+l1sIAvaVOUjHNCJqAjR8XSb5+wfi111BfR9YBK1XrExWN9mkmCIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G2LkS8T+; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729272591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4ahBqgvpjZeA55QcnaUrZX/lYLWJokzFN2P76W1IEXw=;
	b=G2LkS8T+fgGP95G4QtguxO/5Q03dBsufmhCFQsYbQ45ZGv2RrBFyvBOkQKFVcOkoTiIFCp
	aAqZpA33TM8Nx09mTSw5hdzok7/dZOWEiHOA615JyuXsycD91r13cDnLWQonClEwKgmV+s
	UFYRRjKluBZ3FjZqZg9nXXn0rImQNnA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: Remove redundant word "for"
Date: Fri, 18 Oct 2024 19:29:25 +0200
Message-ID: <20241018172924.159221-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

s/for//

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 Documentation/maintainer/pull-requests.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/maintainer/pull-requests.rst b/Documentation/maintainer/pull-requests.rst
index 00b200facf67..0d63d9d7e347 100644
--- a/Documentation/maintainer/pull-requests.rst
+++ b/Documentation/maintainer/pull-requests.rst
@@ -50,7 +50,7 @@ so outline what is contained here, why it should be merged, and what, if
 any, testing has been done.  All of this information will end up in the tag
 itself, and then in the merge commit that the maintainer makes if/when they
 merge the pull request. So write it up well, as it will be in the kernel
-tree for forever.
+tree forever.
 
 As said by Linus::
 
-- 
2.47.0


