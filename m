Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A638B18A1B4
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2020 18:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgCRRlf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 18 Mar 2020 13:41:35 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36358 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgCRRlf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Mar 2020 13:41:35 -0400
Received: by mail-pj1-f65.google.com with SMTP id nu11so1512114pjb.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2020 10:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNn1MyCt2mGwclhH+lTXpL3RrIiuOj8izAxEFcctuh0=;
        b=DSNlMfPiqlXlQt/MsYetS2BQ6R2wEJ3c1t6KNws2trMZh9SxxamrZ1uHHuhiiO0o4/
         swt9vPbxpEdVlQxwaUbrf/rlg3t6ooSYAFJp9nxPCmrfk2rCak+nL8C9mUtrM9C3C6UJ
         D7ibkPeRWNoYuJ5uyJusWbQakk9zkngN1PipE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNn1MyCt2mGwclhH+lTXpL3RrIiuOj8izAxEFcctuh0=;
        b=VbMyBwAt4LUYVzWbhfbntFmgfK+/oGVF1M+tiH1AvQ5fjKUNW4hlYw0Sl/spC+rsbx
         OLKwx58nQhjj4PYTo+bFTqmQtgZNiLDsGupvZNulpGwdamm39zMfKoROoQBMh+HW0uj9
         TGJly0KhEtHzmF/dNMTY/PoGhi1TXs81rBArgTmFyjVv+xocG/JOivoG48p2EnGWcUBW
         yiVaev3voONsTarD3cShSHJqFmhthGuwy2+W3gVd4MmbCwhyT5oZtHyktPZ4ayrI/YeU
         hxd4kif8yqgyFEIi73BKNCGZV1ch/nhZOofDh/EwIcvmvUWvpEl9ut7lxSM5Z302zAdv
         Gp5g==
X-Gm-Message-State: ANhLgQ3lfLGCzJanIZ/DJ0d5me7FCe8xL33PGC3svU6mwbWG5OmnuZHf
        0Hmz9p/9LImkoVyVprqGYLffAuHgIDg=
X-Google-Smtp-Source: ADFU+vsCzkaDgLM3wrqCGqMUJ3MoMZKhTWiMKgz5c7yVRtAZN7plOO3+sCkPWlRVDngQgKPxV3NXQQ==
X-Received: by 2002:a17:90b:1918:: with SMTP id mp24mr4179183pjb.98.1584553294548;
        Wed, 18 Mar 2020 10:41:34 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k5sm2934127pju.29.2020.03.18.10.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:41:33 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 0/2] docs: locking: Fix a typo and drop :c:func:
Date:   Wed, 18 Mar 2020 10:41:31 -0700
Message-Id: <20200318174133.160206-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix a typo in the hardirq section where we're missing a word and 
then drop :c:func: markup throughout.

Changes from v1:
 * New patch to drop :c:func:

Stephen Boyd (2):
  docs: locking: Add 'need' to hardirq section
  docs: locking: Drop :c:func: throughout

 Documentation/kernel-hacking/locking.rst | 176 +++++++++++------------
 1 file changed, 88 insertions(+), 88 deletions(-)


base-commit: fb33c6510d5595144d585aa194d377cf74d31911
-- 
Sent by a computer, using git, on the internet

