Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF8E57A8E8
	for <lists+linux-doc@lfdr.de>; Tue, 19 Jul 2022 23:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236955AbiGSVXn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jul 2022 17:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237069AbiGSVXm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 17:23:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB68E61711
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 14:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658265817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=l1TU2R5pboSet6ITgX36x+voVt+WLRvd3J0ToQzPKr4=;
        b=eRRok27c3pXneX/YlQ26svLqnMYeSStIXMBJxrhaNUtiZ4G9t6kF4juYiGGt0O9z68AdQ5
        z4kibTclVW69MzkVWpN9NVFjjIC+RZyn5mKVsbwkPdJ1SdxTSPhdJPMcyGPkriui2kjncR
        LbC/ffJbERF7/PfbzTmBaqnj8G8MNeM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-nli3cICtMAaNG7dqPGHFpQ-1; Tue, 19 Jul 2022 17:23:36 -0400
X-MC-Unique: nli3cICtMAaNG7dqPGHFpQ-1
Received: by mail-qv1-f72.google.com with SMTP id oo28-20020a056214451c00b004732e817c96so8228464qvb.22
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 14:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l1TU2R5pboSet6ITgX36x+voVt+WLRvd3J0ToQzPKr4=;
        b=6acFc2LaYWvbBYjL/CJejs+vJNJrZMV1NCdzIxS04tjbBHT9os5zWKyWY6vvY9ZJHN
         NGFMCqZth4FVDcJwQZexGpswlI0EE8CedKXu5qP5qjoLcR9Sgpn+DxL+8B982ypRCnye
         HaRSpH5ALzKaRLFWqRu6eFkM4jueMzPD1rFX3mGQPB67TYDdVRHCDaWfg/faG9HK9xu5
         iEL2KiHLTI2W2kBlj7qX0QlSRdCzTwNeMrh2oP6bQnc5XrlkOzt7t2aV7k+1OOy6tu/u
         DwFcm1izLzVgtx/cHXz4oyQvYu9SuSwlQ/HpiB/fTXrYmUFym3ineuRBs223XEt08Ly1
         WsHg==
X-Gm-Message-State: AJIora+mkrmQXrst/5P+5suOwX7ibLzrbzf/YBnYkRntZwb63hqmOxIv
        +q35sXptkv3sm7WTFMbce0OIwW4ub3IoPQ8MABMDK3OmwslmjigixU1hjCARks/w00MRqHdy4+t
        ZmDj1l0ZrKEvxMnCmTaeb
X-Received: by 2002:a05:620a:24d1:b0:6b5:920b:d322 with SMTP id m17-20020a05620a24d100b006b5920bd322mr11460295qkn.102.1658265816305;
        Tue, 19 Jul 2022 14:23:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uQyLEwJ5TVS2RJifrC96oJqY/QforayKxBACf0fpS9TyhAhQ8kUEPoFLC/H7rZJmZjldw6Pg==
X-Received: by 2002:a05:620a:24d1:b0:6b5:920b:d322 with SMTP id m17-20020a05620a24d100b006b5920bd322mr11460267qkn.102.1658265816086;
        Tue, 19 Jul 2022 14:23:36 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-37-74-12-30-48.dsl.bell.ca. [74.12.30.48])
        by smtp.gmail.com with ESMTPSA id t18-20020a05620a451200b006a6b374d8bbsm1797249qkp.69.2022.07.19.14.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 14:23:35 -0700 (PDT)
Date:   Tue, 19 Jul 2022 17:23:33 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Axel Rasmussen <axelrasmussen@google.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Dmitry V . Levin" <ldv@altlinux.org>,
        Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
        Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>,
        Mel Gorman <mgorman@techsingularity.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>, Nadav Amit <namit@vmware.com>,
        Shuah Khan <shuah@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        zhangyi <yi.zhang@huawei.com>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 3/5] userfaultfd: selftests: modify selftest to use
 /dev/userfaultfd
Message-ID: <Ytcg1aPwU/AdzifS@xz-m1.local>
References: <20220719195628.3415852-1-axelrasmussen@google.com>
 <20220719195628.3415852-4-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220719195628.3415852-4-axelrasmussen@google.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 19, 2022 at 12:56:26PM -0700, Axel Rasmussen wrote:
> We clearly want to ensure both userfaultfd(2) and /dev/userfaultfd keep
> working into the future, so just run the test twice, using each
> interface.
> 
> Instead of always testing both userfaultfd(2) and /dev/userfaultfd,
> let the user choose which to test.
> 
> As with other test features, change the behavior based on a new
> command line flag. Introduce the idea of "test mods", which are
> generic (not specific to a test type) modifications to the behavior of
> the test. This is sort of borrowed from this RFC patch series [1], but
> simplified a bit.
> 
> The benefit is, in "typical" configurations this test is somewhat slow
> (say, 30sec or something). Testing both clearly doubles it, so it may
> not always be desirable, as users are likely to use one or the other,
> but never both, in the "real world".
> 
> [1]: https://patchwork.kernel.org/project/linux-mm/patch/20201129004548.1619714-14-namit@vmware.com/
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

