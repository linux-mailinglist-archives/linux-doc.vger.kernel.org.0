Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E52A25C61D
	for <lists+linux-doc@lfdr.de>; Thu,  3 Sep 2020 18:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgICQFv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 3 Sep 2020 12:05:51 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:39284 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728468AbgICQFu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1599149148; bh=6i0DqJnENQdGfDopdWnFNlTiBQ+JjTsPKfiNbua8tbc=;
        h=From:To:Cc:Subject:Date;
        b=QqfpLKXBoUsZCLGFmgV+dPdYE+48hklS+nEnbCdCB+PLNL9IbcBA3zyNw33ffVu6w
         Up4EpvVjzr1XAk/sKQ+32Cm5ae6Jybi60ZCg+2G/mjz/1VkwZ0okNqQqObghW8PYo2
         SwOrIaM6dpLWSZXEdCB76yVbSoyvR6jhWIda4IA4=
From:   Drew DeVault <sir@cmpwn.com>
To:     "Jonathan Corbet" <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Drew DeVault <sir@cmpwn.com>
Subject: [PATCH v3 0/4] Improvements to submitting-patches.rst
Date:   Thu,  3 Sep 2020 12:05:41 -0400
Message-Id: <20200903160545.83185-1-sir@cmpwn.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks for the feedback Jonathan! This one should be good to go.

- Fixes the allocation of header numbering removal between the patches
- Corrects the length of the --- under each header
- Adds DCO context to the new maintainer document
- Removes information about git request-pull

Drew DeVault (4):
  submitting-patches.rst: remove heading numbering
  Documentation/process: expand plain-text advice
  Documentation/maintainer: rehome sign-off process
  submitting-patches.rst: presume git will be used

 Documentation/maintainer/index.rst            |   1 +
 .../maintainer/modifying-patches.rst          |  50 ++++
 Documentation/process/email-clients.rst       |   5 +
 Documentation/process/submitting-patches.rst  | 257 ++++--------------
 4 files changed, 105 insertions(+), 208 deletions(-)
 create mode 100644 Documentation/maintainer/modifying-patches.rst

-- 
2.28.0

