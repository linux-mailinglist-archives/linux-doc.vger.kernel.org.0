Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2843C5359B0
	for <lists+linux-doc@lfdr.de>; Fri, 27 May 2022 08:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239207AbiE0GzE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 May 2022 02:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344633AbiE0Gy7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 May 2022 02:54:59 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BF966AE2
        for <linux-doc@vger.kernel.org>; Thu, 26 May 2022 23:54:58 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id p4so5534806lfg.4
        for <linux-doc@vger.kernel.org>; Thu, 26 May 2022 23:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=33H7bzlF73boyoKARvolMJlGymprQ+hHPrvlaQBxLsY=;
        b=cFB7s0A6Vncow/pUpyHYeS5uRA3Sa1oL7zKnv4ZePJIBO1Hlol5vIxoRR8Pf9MTFN9
         oS93ak0fZyAhEeiY9jUgF6ruvGq0YdAcUA/FlNpE9Yi9Vzbw7BtUCGUziY3UdhZZ/vaf
         BOcIBSc1JtgDPny3sWXd1/rxfYsgb2ftoQVLZkOGNEO8qVK7fkH47I/rHZNBAPQ9aIBE
         Ws3Q6Neg6HiOA13NJiFH+4aMsQXXH0Qtnyn5l7BDNF2MbdsXBuc2uQSh4/OKnVb6hoRD
         /05oteHXZuuGdsvtQhqtoONPPPaSdkAusn+RjVQFzIjchroyCy7VqFLfAJAFNgzS6Elj
         kkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=33H7bzlF73boyoKARvolMJlGymprQ+hHPrvlaQBxLsY=;
        b=ZvN18Ks2WPQfNhg/N6ewwbVNLYWiQnJgn7jTrWKedWU+45E1RDNII+yFGIsf5pFBZX
         P8tK3b0I4e/9T/5TWBlL6HFrJloGegz9vUk/J77SQSxGxTvDfZO1k+GRTAuxytKuWgG4
         XBH+JGPQn8x0pNqgq32g/KIYPPxoUzuQ7zHM36QWed0jO7oN4upqHtVlYY3VCp3ynqHe
         HeKIk1Sh6kbyZKaHlnK49weWQmrbuKYcY6kRkBFqgctWkgPXA93Fbav4Sv8pjjFMHttK
         IjssrHAgcob+qCVrK8pmU3uR+Qcm9CTW8AEmArVEjQSoGlt4RqE1NA0iWqkQfLJ0rRyM
         MtfQ==
X-Gm-Message-State: AOAM531zRj17vLU/6wyDsByvAaOfVe5deJyBcvNSD8qE8sjxiSA8kco5
        2m70Kxz/a1ynjOcjYg417Uefube3wiXGsjAphRM=
X-Google-Smtp-Source: ABdhPJxl8H0jAMQNpnwAKcBcQ33aGejJlX/037l/K5+4xKUMvuR/pjYp4WPxSC7JK7gs2uOWP4QKrWTIYDKqWUkuF1k=
X-Received: by 2002:ac2:5a07:0:b0:478:8433:30c1 with SMTP id
 q7-20020ac25a07000000b00478843330c1mr12757539lfn.377.1653634496714; Thu, 26
 May 2022 23:54:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6512:b84:0:0:0:0 with HTTP; Thu, 26 May 2022 23:54:56
 -0700 (PDT)
Reply-To: BAkermarrtin@gmail.com
From:   Martin Baker <alfaroukkhadija@gmail.com>
Date:   Fri, 27 May 2022 06:54:56 +0000
Message-ID: <CAF1Q0JmVfSYK8Jf00Amkz8uT+RCvTW6Tq6L7uA8Gx=d38KfR4w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,


I wrote to you this morning because I have something to tell you, please
let me know if you read my previous post today.
