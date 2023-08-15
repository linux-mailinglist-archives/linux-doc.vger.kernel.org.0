Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36F3B77D376
	for <lists+linux-doc@lfdr.de>; Tue, 15 Aug 2023 21:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239915AbjHOTnw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Aug 2023 15:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239928AbjHOTna (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Aug 2023 15:43:30 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 300DCE48;
        Tue, 15 Aug 2023 12:43:29 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-317798b359aso5002813f8f.1;
        Tue, 15 Aug 2023 12:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692128607; x=1692733407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ME4brVjvaPyUiEjp65OuZNAAmyell1TrBHH94k7UmrI=;
        b=sZVmBDc7i6SbnyPqMduap2oDVbVMtANyVo6guM8HG1Iax2dD2PwdyKiwk88Xqa/Gi/
         y+jt6LpEiw0qF21VC9RwtE0c0FBVGYF188EtI1oHmWGsxAMlt2GkG8J78T0icfoG5amY
         B9ALE6PYAod5sLtOP3YM+shOZ4GWXDuTM1iZpPjP/XZPaGKuyhu4fyB4fnSwf2XQz/Ga
         YU7NZJssnXJGzxaQkItgRpDDKL5HswNDfFVbTZvgnlGnck6x4OWZKpUCcbNBuHB3RH1A
         mYxDJp/kNnAbyQaDmtmz40LHBtf36iz8SxD+rzmNKQdmjKuQVSVAy9BUssbPa4O81wCh
         fcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692128607; x=1692733407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ME4brVjvaPyUiEjp65OuZNAAmyell1TrBHH94k7UmrI=;
        b=Q3R3lLNzFwBjhwoRGkp7CfaGcgSqudHp/e4XvJQ5xByjExLD7utSCQXEcy3nqRrpZR
         rek17r2pBQt257VwmmVPCVdtdCNF+nRWQt7n/Ca3nYXHIfDgErgqCXF7ZLHW1QVpFQw2
         RlJpZd+GRnyVTr9mymyUT4Wu8fLov+WcSGOKclFOtdgPBx+vSLhLVheflHEanAnolTXq
         HfG7nuR28TsgKKpUCzezwa4Nl62D9G/toxR5S3pYHFVbsFsJ1X4oYfly7FvWB7SePulJ
         UP00IVXvnHlrYJi9bV9FsVNqW5h62jevQ0yJV0HwsAcrvc2hOljArcyiqlVjyMG+z6ZX
         /ldg==
X-Gm-Message-State: AOJu0Yz0cQgDPoA1/0+ppKiww+e3DXDHa/0JiS557q6KtlzDMQvXFD+q
        kOPpTpLocS5Pep0iisSJBNe66TR0qvrpIr9S
X-Google-Smtp-Source: AGHT+IGvqjg6g7RYRJr6qqw6cKZ8aRPtTJYBCVaU5keEmY5P224NXpF1VtTVlE6x2fwAU53dekYmIA==
X-Received: by 2002:a5d:5962:0:b0:319:6afc:7a3c with SMTP id e34-20020a5d5962000000b003196afc7a3cmr7315258wri.10.1692128606868;
        Tue, 15 Aug 2023 12:43:26 -0700 (PDT)
Received: from imac.fritz.box ([2a02:8010:60a0:0:9934:e2f7:cd0e:75a6])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d6610000000b003179d5aee67sm18814892wru.94.2023.08.15.12.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 12:43:26 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     donald.hunter@redhat.com, Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v2 00/10] tools/net/ynl: Add support for netlink-raw families
Date:   Tue, 15 Aug 2023 20:42:44 +0100
Message-ID: <20230815194254.89570-1-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patchset adds support for netlink-raw families such as rtnetlink.

Patch 1 contains the schema definition
Patches 2 & 3 update the schema documentation
Patches 4 - 7 extends ynl
Patches 8 - 10 add several netlink-raw specs

The netlink-raw schema is very similar to genetlink-legacy and I thought
about making the changes there and symlinking to it. On balance I
thought that might be problematic for accurate schema validation.

rtnetlink doesn't seem to fit into unified or directional message
enumeration models. It seems like an 'explicit' model would be useful,
to force the schema author to specify the message ids directly.

There is not yet support for notifications because ynl currently doesn't
support defining 'event' properties on a 'do' operation. I plan to look
at this in a future patch.

The link and route messages contain different nested attributes
dependent on the type of link or route. Decoding these will need some
kind of attr-space selection that uses the value of another attribute as
the selector key. These nested attributes have been left with type
'binary' for now.

v1 -> v2:
  - Put mcast-group changes in separate patch
  - Put decode_fixed_header refactoring in separate patch
  - Avoid refactoring decode_enum
  - Rename NetlinkProtocolFamily -> NetlinkProtocol and
    GenlProtocolFamily -> GenlProtocol and store in self.nlproto
  - Add spec for rt link.

Donald Hunter (10):
  doc/netlink: Add a schema for netlink-raw families
  doc/netlink: Document the genetlink-legacy schema extensions
  doc/netlink: Document the netlink-raw schema extensions
  tools/ynl: Add mcast-group schema parsing to ynl
  tools/net/ynl: Refactor decode_fixed_header into NlMsg
  tools/net/ynl: Add support for netlink-raw families
  tools/net/ynl: Implement nlattr array-nest decoding in ynl
  doc/netlink: Add spec for rt addr messages
  doc/netlink: Add spec for rt link messages
  doc/netlink: Add spec for rt route messages

 Documentation/netlink/netlink-raw.yaml        |  414 +++++
 Documentation/netlink/specs/rt_addr.yaml      |  179 +++
 Documentation/netlink/specs/rt_link.yaml      | 1374 +++++++++++++++++
 Documentation/netlink/specs/rt_route.yaml     |  288 ++++
 Documentation/userspace-api/netlink/intro.rst |    2 +
 Documentation/userspace-api/netlink/specs.rst |   64 +
 tools/net/ynl/lib/nlspec.py                   |   26 +
 tools/net/ynl/lib/ynl.py                      |  153 +-
 8 files changed, 2461 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/netlink/netlink-raw.yaml
 create mode 100644 Documentation/netlink/specs/rt_addr.yaml
 create mode 100644 Documentation/netlink/specs/rt_link.yaml
 create mode 100644 Documentation/netlink/specs/rt_route.yaml

-- 
2.41.0

