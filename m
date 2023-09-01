Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6519B78FA10
	for <lists+linux-doc@lfdr.de>; Fri,  1 Sep 2023 10:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236916AbjIAIks convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-doc@lfdr.de>); Fri, 1 Sep 2023 04:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233494AbjIAIkq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Sep 2023 04:40:46 -0400
Received: from us-smtp-delivery-44.mimecast.com (unknown [207.211.30.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DB110CF
        for <linux-doc@vger.kernel.org>; Fri,  1 Sep 2023 01:40:42 -0700 (PDT)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-W-r-CbQfPi2e9mKkUC7dCw-1; Fri, 01 Sep 2023 04:40:25 -0400
X-MC-Unique: W-r-CbQfPi2e9mKkUC7dCw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12482803E2E;
        Fri,  1 Sep 2023 08:40:25 +0000 (UTC)
Received: from hog (unknown [10.45.224.12])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AEF0492C13;
        Fri,  1 Sep 2023 08:40:23 +0000 (UTC)
Date:   Fri, 1 Sep 2023 10:40:21 +0200
From:   Sabrina Dubroca <sd@queasysnail.net>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, rdunlap@infradead.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH net v3] docs: netdev: document patchwork patch states
Message-ID: <ZPGjdQOfM2POGoEW@hog>
References: <20230901014131.540821-1-kuba@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230901014131.540821-1-kuba@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: queasysnail.net
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_VALIDITY_RPBL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2023-08-31, 18:41:29 -0700, Jakub Kicinski wrote:
> The patchwork states are largely self-explanatory but small
> ambiguities may still come up. Document how we interpret
> the states in networking.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v3:
>  - clarify that patches once set to Awaiting Upstream will stay there

mhmm, the patch looks identical to v2. Did you post the wrong version?

-- 
Sabrina

