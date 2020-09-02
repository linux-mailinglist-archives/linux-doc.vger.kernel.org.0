Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7149425B065
	for <lists+linux-doc@lfdr.de>; Wed,  2 Sep 2020 17:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgIBP6E (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Sep 2020 11:58:04 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:36962 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbgIBP6D (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 Sep 2020 11:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1599062281; bh=h8dJcCYxENawkIMqWNr9jz0qpret4huIYaf77nBTqR8=;
        h=From:To:Cc:Subject:Date;
        b=a7sfXj4iNp+BE6GhE9hVXR3cr8X3Tgq8RDx5hchYeH1wuMwsFS/Kxk1OvLPRG/ArA
         rTr4eNSZ9/3yILSWcm0Kxz/R22kPWqrNeb83G7k4GL6HqyreENnXIRpN6/uFuPQXJ5
         NvRAcBqN6FPLnM977KO0wvT2IJ2C/9/0RJe1kgWo=
From:   Drew DeVault <sir@cmpwn.com>
To:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc:     Drew DeVault <sir@cmpwn.com>
Subject: [PATCH 0/4] Improvements to submitting-patches.rst
Date:   Wed,  2 Sep 2020 11:57:55 -0400
Message-Id: <20200902155759.55895-1-sir@cmpwn.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series updates submitting-patches.rst, streamlining it for
git usage, re-homing some of the content to better locations, and
updating it to follow the modern conventions of Documentation/.

This is a revision to <20200827174237.121004-1-sir@cmpwn.com>.

Drew DeVault (4):
  submitting-patches.rst: remove heading numbering
  Documentation/process: expand plain-text advice
  Documentation/maintainer: rehome sign-off process
  submitting-patches.rst: presume git will be used

 Documentation/maintainer/index.rst            |   1 +
 .../maintainer/modifying-patches.rst          |  50 ++++++
 Documentation/process/email-clients.rst       |   5 +
 Documentation/process/submitting-patches.rst  | 170 +++++-------------
 4 files changed, 96 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/maintainer/modifying-patches.rst

-- 
2.28.0

