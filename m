Return-Path: <linux-doc+bounces-2188-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F17E9256
	for <lists+linux-doc@lfdr.de>; Sun, 12 Nov 2023 20:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB9AE1F20FC8
	for <lists+linux-doc@lfdr.de>; Sun, 12 Nov 2023 19:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF53918058;
	Sun, 12 Nov 2023 19:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYH0rlFs"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE979179BF;
	Sun, 12 Nov 2023 19:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC19C433C7;
	Sun, 12 Nov 2023 19:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699818377;
	bh=eYWOuBaRm7gUBwsw8MKJnCTGV0ZszqASzlgqM1IUQmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nYH0rlFsJBrDrANNHDdlzS61wIc8bZdp2hUgWOgsXWFKJCZ3KnMObjtCni4f0diDU
	 g2Z4RT4NsvLxJILjF6kRSpebeBN+wmwGsk58Lo7CXP1WrEiSR2/Dq7VqVB6IBgpJGb
	 F3Bj+xKTXSGqZK3VdTW/ILQW9PbdUvedatn13RqucpgrvVjXD6L+LPlOl1yyR9bBpW
	 N3JNbYtPri7PhmBeUfaRkXqN1HPMpZVTSY4rrXAW/LFEJjVpkDBvYOXg1dTYa48TfP
	 D5vOtEL2SFxCEtfCEhA1zNN/2mlo4BWYjCz8S2hcrEyCty/qC9MOg8mCmaFsRwY3qG
	 TPdccTEqa+wWA==
From: SeongJae Park <sj@kernel.org>
To: 
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 7/8] Docs/mm/damon/design: Document DAMOS quota auto tuning
Date: Sun, 12 Nov 2023 19:46:06 +0000
Message-Id: <20231112194607.61399-8-sj@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231112194607.61399-1-sj@kernel.org>
References: <20231112194607.61399-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the DAMOS quota auto tuning feature on the design document.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 1f7e0586b5fa..3e1b34f55bb8 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -346,6 +346,17 @@ the weight will be respected are up to the underlying prioritization mechanism
 implementation.
 
 
+.. _damon_design_damos_quotas_auto_tuning:
+
+Aim-oriented Feedback-driven Quotas Auto-tuning
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Automatic feedback-driven quota tuning.  Instead of setting the absolute quota
+value, users can provide feedback about how well DAMOS is achieving their goal.
+If the feedback says DAMOS is still not achieving the goal, DAMOS increases the
+quota.  If DAMOS is over-achieving the goal, DAMOS decreases the quota.
+
+
 .. _damon_design_damos_watermarks:
 
 Watermarks
-- 
2.34.1


