Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B87E6DCA6D
	for <lists+linux-doc@lfdr.de>; Mon, 10 Apr 2023 20:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbjDJSHX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Apr 2023 14:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjDJSHR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Apr 2023 14:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267D82703
        for <linux-doc@vger.kernel.org>; Mon, 10 Apr 2023 11:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681149979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=IT3jC7AVGFDWN5+2QSJmXDWRAxru1buk6lN5s+Jf7j4=;
        b=EQCmXok2gd+5nwgVnjkeZTFOaEjluXNf7jT2BlbQTscD3aKyV38sIJwrK46hpPV/f0Dek5
        2bX0+KqJhSUXd+efYBwNKbbhR1L07bdS5rK8avbhOnJnOqb4uTXck2Fa1fkV3m+MHYzmoO
        7VjyH1u9qEA5NeAWyPEUYVrXvp9lpn0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-Cs151I7pNJeGsXXn-R-o-A-1; Mon, 10 Apr 2023 14:06:13 -0400
X-MC-Unique: Cs151I7pNJeGsXXn-R-o-A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC8BA800B23;
        Mon, 10 Apr 2023 18:06:12 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.95])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 02A04492C13;
        Mon, 10 Apr 2023 18:06:11 +0000 (UTC)
From:   Eric Blake <eblake@redhat.com>
To:     josef@toxicpanda.com, linux-block@vger.kernel.org,
        nbd@other.debian.org
Cc:     philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
        christoph.boehmwalder@linbit.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] nbd: s/handle/cookie/
Date:   Mon, 10 Apr 2023 13:06:07 -0500
Message-Id: <20230410180611.1051618-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2 was here: https://lkml.org/lkml/2023/3/17/1107
since then:
- squash patch 2/5 and 3/5 into 3/4 [Ming]
- add Josef's R-b
- tweak commit messages to match commits in userspace NBD (code itself
  is unchanged, modulo the patch squash)

Eric Blake (4):
  uapi nbd: improve doc links to userspace spec
  uapi nbd: add cookie alias to handle
  block nbd: use req.cookie instead of req.handle
  docs nbd: userspace NBD now favors github over sourceforge

 Documentation/admin-guide/blockdev/nbd.rst |  2 +-
 drivers/block/nbd.c                        |  6 +++---
 include/uapi/linux/nbd.h                   | 25 +++++++++++++++++-----
 3 files changed, 24 insertions(+), 9 deletions(-)


base-commit: 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d
-- 
2.39.2

