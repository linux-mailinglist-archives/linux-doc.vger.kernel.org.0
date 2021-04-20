Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA66C366014
	for <lists+linux-doc@lfdr.de>; Tue, 20 Apr 2021 21:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbhDTTNC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Apr 2021 15:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbhDTTNB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Apr 2021 15:13:01 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697C6C06138A
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 12:12:29 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a5so7882510ljk.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Apr 2021 12:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flodin-me.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C+YGLGWSCwyBi7GWc5iobo86zWud5ociPw5R9i9Mclo=;
        b=j0v4EwRzCPSk8FjluMd+6EvPf7spfpst3slMum25f3fl5lqF2EsX/o5pxr8eqV5q9X
         tQJbnk1dmqzheg9XctkhcUnEtDKasp2RooZVGP8OEvYWi+Oo/M1A0cSbR/T1KZEEqUiq
         A0IdPK1IP1rvJ+ntTqs2WWK9XWmY2gAOuLI5wBkDoTZF64r1J8QSxGD05FvDPGVvtSEu
         5aeHd37M87BGmPeR3IxSxwaD0ldJb6xiKSTJwdrIwQTb7DfdLRDRbpjZUoCrEA20LIqC
         /EoNRESwn1ol6RQ4396o49p/Pgrll7UPYHOAElYcFtCyiaw+VS5CiMCtTRC8UmrCLblP
         5QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C+YGLGWSCwyBi7GWc5iobo86zWud5ociPw5R9i9Mclo=;
        b=YCNQaEtiD1TqntlMwC673N3YI8vSYwLTPYZbyzrvSyNpJSWE7iQFkzQfEKDjl6J54x
         59pxSdZyDLtQRcWAP2Oi34FO7LiC2RhusbznFvRhOzD8893hRWjuq830M2xa9VLD6o5s
         DoFmPVdvMVtPcBm2yS/8R4UyAYak0nlZpKljSkHjJAriLZZ/ln6B5ETE8brAcekFAlkf
         K4NloW+wYW6t8bpc0Z4Idl0tWVaoQ7Ogh3sE8ADB45oQbEU49c2GjYCkQvLwyXJYeW+I
         jbEEd+oUYmmzkMzCIXjt32omqiXWBRerb/dNNMith50mGavOUPRMPNW6/9XR341ilIuI
         uJNQ==
X-Gm-Message-State: AOAM53052b5purSOgLLbHAb+/va7F0ARv3HUghQa6gMlCiBOf0wMusrT
        qyVyqmcJqd4DTBM9sbA98vM3hQ==
X-Google-Smtp-Source: ABdhPJwNXIQqX/1JHqGG2nwkwA9dAjfc2wnbVxGgxDBDKNiHbF9gMitkWfK0F1TiVZiGfcfOEzvYQg==
X-Received: by 2002:a2e:a3d2:: with SMTP id w18mr15532491lje.457.1618945947907;
        Tue, 20 Apr 2021 12:12:27 -0700 (PDT)
Received: from trillian.bjorktomta.lan (h-158-174-77-132.NA.cust.bahnhof.se. [158.174.77.132])
        by smtp.gmail.com with ESMTPSA id p11sm17404lfs.306.2021.04.20.12.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 12:12:27 -0700 (PDT)
From:   Erik Flodin <erik@flodin.me>
Cc:     Erik Flodin <erik@flodin.me>,
        Oliver Hartkopp <socketcan@hartkopp.net>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] can: add a note that RECV_OWN_MSGS frames are subject to filtering
Date:   Tue, 20 Apr 2021 21:12:00 +0200
Message-Id: <20210420191212.42753-1-erik@flodin.me>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some parts of the documentation may lead the reader to think that the
socket's own frames are always received when CAN_RAW_RECV_OWN_MSGS is
enabled, but all frames are subject to filtering.

As explained by Marc Kleine-Budde:

On TX complete of a CAN frame it's pushed into the RX path of the
networking stack, along with the information of the originating socket.

Then the CAN frame is delivered into AF_CAN, where it is passed on to
all registered receivers depending on filters. One receiver is the
sending socket in CAN_RAW. Then in CAN_RAW the it is checked if the
sending socket has RECV_OWN_MSGS enabled.

Signed-off-by: Erik Flodin <erik@flodin.me>
---
 Documentation/networking/can.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/networking/can.rst b/Documentation/networking/can.rst
index f8dae662e454..f34cb0e4460e 100644
--- a/Documentation/networking/can.rst
+++ b/Documentation/networking/can.rst
@@ -608,6 +608,8 @@ demand:
     setsockopt(s, SOL_CAN_RAW, CAN_RAW_RECV_OWN_MSGS,
                &recv_own_msgs, sizeof(recv_own_msgs));
 
+Note that reception of a socket's own CAN frames are subject to the same
+filtering as other CAN frames (see :ref:`socketcan-rawfilter`).
 
 .. _socketcan-rawfd:
 
-- 
2.31.0

