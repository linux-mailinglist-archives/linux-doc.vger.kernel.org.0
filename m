Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C08312A3B2
	for <lists+linux-doc@lfdr.de>; Tue, 24 Dec 2019 18:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfLXRz5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Dec 2019 12:55:57 -0500
Received: from mail-vs1-f44.google.com ([209.85.217.44]:41823 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfLXRz5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Dec 2019 12:55:57 -0500
Received: by mail-vs1-f44.google.com with SMTP id f8so12873752vsq.8
        for <linux-doc@vger.kernel.org>; Tue, 24 Dec 2019 09:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=generalsoftwareinc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=qAQiP9imOCYoI9n+AcXLTq7zfRlO4PU4XGOsmdEoMlw=;
        b=Y/RNqmVrVUQbA5WiGAT0yPj2GRXKyVySRqoZQ8ImgqyLqczo1wfmav26rKuUGyQ516
         Q1bkXCLSJBl0/iiTeM2HvNaallxah2FB1etjsaVZn79Rk7GLp5vpBYsEt9lGhv5WnF4r
         hTIfYnmxPkDXitFkkdcxfnERTEnSRr0xClDC0EUVaDYePAX31Myl2Ez22W0W4uv8Rqx+
         8iwHxvpFYvqaed4YEvkY/Q/6qSB6crRihoTlPBvGz85b8reOmFSGpXleWuWr/xYZH74z
         iM5N62OvJeByoNmLxcbxe4OKDTEvqIGFOt7+p86pXyW6vKibv7OQ4BNn6R7EmR9j4EdZ
         f5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=qAQiP9imOCYoI9n+AcXLTq7zfRlO4PU4XGOsmdEoMlw=;
        b=X/PHb7CoU0+0ta08/G+KasttHroJrBPov9wpmGi2VeYd28jlxWTWPbEn/qpIzs9uSj
         6cwJ9M7pivlCdiKpSeYPIKYGIac8hHfXYDFJu4S9phJKv3b7pDO4qibAUTrnqsCCIulE
         npoSphBtTi63tvbuZ1llTq0G2lqVuTaw65bTXVVpiFXp+UoO2XhMYCPQGHDHYRzROLum
         JvBFauki4QWAiYTJPrkbcTxRZjITdwR/7axPZQg+0p9uORBPoCsiylNLJx3Wdq1E+XXx
         pJXZH+u2tGaadA/t/6K1kIkpPmrRD97jfpJFAwuC03SBme+40yKmlwjwdjqBYk8fynnv
         nxUQ==
X-Gm-Message-State: APjAAAVa2vRYMhXlTpNa+tIICcWVr5jxfEzJkTz47AuUZS03pKHCxyDv
        LERG2752B2Df5gpWI29m8xj2Zw==
X-Google-Smtp-Source: APXvYqx6KjAfDoXnQzQCFG4LBLgdECoUQzcLgp3MLB3z6dzXOnZRCdq++5kRrv/au+YCw4o7TtJh7w==
X-Received: by 2002:a05:6102:5ea:: with SMTP id w10mr6042478vsf.183.1577210156063;
        Tue, 24 Dec 2019 09:55:56 -0800 (PST)
Received: from frank-laptop ([172.97.41.74])
        by smtp.gmail.com with ESMTPSA id b4sm3003190vsr.5.2019.12.24.09.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2019 09:55:55 -0800 (PST)
Date:   Tue, 24 Dec 2019 12:55:54 -0500
From:   "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     joel@joelfernandes.org, saiprakash.ranjan@codeaurora.org,
        nachukannan@gmail.com
Subject: [PATCH 0/3] docs: ftrace: Fix minor issues in the doc
Message-ID: <cover.1577209218.git.frank@generalsoftwareinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I didn't want to be pushy with these minor fixes but occur to me
now that, even all seem to be clear in the latest version of the
RFC (v2) related to these fixes, a clean patchset could be expected
after the RFC. So here we go:

Clarifies the RAM footprint of buffer_size_kb without getting into
implementation details.

Fix typos and a small notation mistakes in the doc.

Changes in this patchset (since RFC v2)
  - Take out the notation mistake into its own commit because it
    is not a typo.

Changes in RFC v2:
  - Removes implementation description of the RAM footprint of
    buffer_size_kb, but still make the corresponded clarification.

  - Removes a patch that was just for illustration purposes because
    Steven already got the issue that I was referring to.

  - Adds a patch to fix other typos in the doc.

Frank A. Cancio Bello (3):
  docs: ftrace: Clarify the RAM impact of buffer_size_kb
  docs: ftrace: Fix typos
  docs: ftrace: Fix small notation mistake

 Documentation/trace/ftrace.rst             | 9 +++++----
 Documentation/trace/ring-buffer-design.txt | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.17.1

