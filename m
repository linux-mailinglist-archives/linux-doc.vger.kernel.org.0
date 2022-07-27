Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2699B58313D
	for <lists+linux-doc@lfdr.de>; Wed, 27 Jul 2022 19:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243231AbiG0RxN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Jul 2022 13:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243149AbiG0Rw6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jul 2022 13:52:58 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE187972E3
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 09:57:37 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso2839352pjo.1
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 09:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=7jInUBkxLFSPqaOdCYKqbU/Fqt97ugWJI87UtMcfk7k=;
        b=TsG9ehKhl0hzvIANVdX0LtyKUQrhYBG/YV5nCdVtZiF1GulLRcv8AFR54WJjfnw1ix
         Qr9MPOT0NSgWH+xx8X6suJRidy4GmoLfbxNTmWHY68NH/eEc8Dm15wojoAgqQoSfFcJr
         1XNzpVvjmJX9gJ5HhjPS1b75NQu2o29EKWtfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7jInUBkxLFSPqaOdCYKqbU/Fqt97ugWJI87UtMcfk7k=;
        b=fgbSKrFCI86GIVUpvr8eT25fN7NbEBCeYAcrsT+0SOuyLtsoitJt6nQKGu+VbbWYKm
         YWJxfG4+0m9sgRyCV0MzYYPTr8BUonjpsBitoNbwU0HFc+4mFsJV+cSY78Wo4t/e5dEG
         x0bEgKxXqAhtH8ItF0fCCrZ385zv43u9Ws2jDiSkChI6QrFb3KDJVS66ZoU0QtKSwJ5C
         q5TQvNolQTF2auCAROnM6eoxI208wlCOjV7jmoB0sL3jy4fLvbwbAVe0K/ycjHR4jqq5
         XvJ+1SJuhAf/r3k8lYyftEtcTR+tIU8X0bc/d40QshywgxINaUHTt791016Vu4nmnlcd
         BC3A==
X-Gm-Message-State: AJIora9lGbZlGbC57qiGxvNWNoFOzh5ClwIP4Vhp1LWtSfFQUs40bkEH
        iTWHUSeQPjEfLR2BGdgTDE+sCa6b/IHcnDPc
X-Google-Smtp-Source: AGRyM1tUiaARDV3hQl3qNDDzrOb0RGQkknp/ZxFNmpE6t5sNab/1XOs3ff91Si/DjFQxBgZGyfOKew==
X-Received: by 2002:a17:902:d582:b0:16d:612c:2d6a with SMTP id k2-20020a170902d58200b0016d612c2d6amr18827036plh.168.1658941056907;
        Wed, 27 Jul 2022 09:57:36 -0700 (PDT)
Received: from rahul_yocto_ubuntu18.ibn.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id c15-20020a631c0f000000b0040c74f0cdb5sm12280280pgc.6.2022.07.27.09.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 09:57:35 -0700 (PDT)
From:   Vikas Gupta <vikas.gupta@broadcom.com>
To:     jiri@nvidia.com, kuba@kernel.org
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        davem@davemloft.net, dsahern@kernel.org,
        stephen@networkplumber.org, edumazet@google.com, pabeni@redhat.com,
        ast@kernel.org, leon@kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, michael.chan@broadcom.com,
        andrew.gospodarek@broadcom.com,
        Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net-next v9 0/2] add framework for selftests in devlink
Date:   Wed, 27 Jul 2022 22:27:19 +0530
Message-Id: <20220727165721.37959-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.17.1
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="0000000000007201ac05e4cc5066"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        MIME_HEADER_CTYPE_ONLY,MIME_NO_TEXT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_NONE,T_TVD_MIME_NO_HEADERS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--0000000000007201ac05e4cc5066

Hi,
  This patchset adds support for selftests in the devlink framework.
  It adds a callback .selftests_check and .selftests_run in devlink_ops.
  User can add test(s) suite which is subsequently passed to the driver 
  and driver can opt for running particular tests based on its capabilities.

  Patchset adds a flash based test for the bnxt_en driver.

  Suggested commands at user level would be as below:

changes from:
v8->v9:
    Only SOB line fixed in 2/2.

v7->v8:
   Some nits requested by jiri@nvidia.com in v7.

v6->v7:
  1) Changed the macros/enums name as suggested by kuba@kernel.org.
  2) Rebase with latest net-next. Dumpit impacted due to recent patches
     by jiri@nvidia.com.
  net: devlink: make sure that devlink_try_get() works with valid pointer during xarray iteration
  net: devlink: move net check into devlinks_xa_for_each_registered_get()

v5->v6:
  Addressed change in .rst file only suggested by jiri@nvidia.com in patch v5.
   
v4->v5:
  Addressed the changes requested by jiri@nvidia.com in patch v4.

v3->v4:
  Addressed the changes requested by kuba@kernel.org in patch v3.

v2->v3:
   1)
   After discussions with jiri@nvidia.com, passing a testmask from
   user to kernel is removed and a flag based arguments are adopted.
   This way we can have more than 32/64 selftests defined in the
   kernel.
   Below is the format from user to kernel and vice-versa.
   
   Kernel to user for show command . Users can know what all tests are
   supported by the driver. A return from kernel to user if driver
   supports TEST1, TEST4, and TEST7.
	______
	|NEST |
	|_____ |TEST1|TEST4|TEST7|...


    User to kernel to execute test: If user wants to execute test4, test8,
	test1...
	______
	|NEST |
	|_____ |TEST4|TEST8|TEST1|...

	After executing the tests kernel return to user.
	|NEST |
	|_____ | NEST|       |NEST|       |NEST|
	        TEST4,RES4   TEST8,RES8   TEST1, RES1
    
    2) Added dumpit in devlink for list/show command.

v1->v2:
  Addressed the changes requested by kuba@kernel.org in patch v1.
  Fixed the style issues. 


Thanks,
Vikas

*** BLURB HERE ***

Vikas Gupta (1):
  devlink: introduce framework for selftests

vikas (1):
  bnxt_en: implement callbacks for devlink selftests

 .../networking/devlink/devlink-selftests.rst  |  38 +++
 .../net/ethernet/broadcom/bnxt/bnxt_devlink.c |  61 +++++
 .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c |  24 +-
 .../net/ethernet/broadcom/bnxt/bnxt_ethtool.h |  12 +
 include/net/devlink.h                         |  21 ++
 include/uapi/linux/devlink.h                  |  29 +++
 net/core/devlink.c                            | 216 ++++++++++++++++++
 7 files changed, 389 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/networking/devlink/devlink-selftests.rst

-- 
2.31.1


--0000000000007201ac05e4cc5066
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
I7qKxvF8Yo7eGTnHRTa99J+6yTd88AKVuhM5TEhpC8cS7qvrQXJje+Uing2xWC4FH76LEWIFH0Pt
x8C1WoCU0ClXHU/XfzH2mYrFANBSCeP1Co6QdEfRAgMBAAGjggHZMIIB1TAOBgNVHQ8BAf8EBAMC
BaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJlLmdsb2JhbHNp
Z24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYIKwYBBQUHMAGG
NWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwME0G
A1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxz
aWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly9j
cmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3JsMCMGA1UdEQQc
MBqBGHZpa2FzLmd1cHRhQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSME
GDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUUc6J11rH3s6PyZQ0zIVZHIuP20Yw
DQYJKoZIhvcNAQELBQADggEBALvCjXn9gy9a2nU/Ey0nphGZefIP33ggiyuKnmqwBt7Wk/uDHIIc
kkIlqtTbo0x0PqphS9A23CxCDjKqZq2WN34fL5MMW83nrK0vqnPloCaxy9/6yuLbottBY4STNuvA
mQ//Whh+PE+DZadqiDbxXbos3IH8AeFXH4A1zIqIrc0Um2/CSD/T6pvu9QrchtvemfP0z/f1Bk+8
QbQ4ARVP93WV1I13US69evWXw+mOv9VnejShU9PMcDK203xjXbBOi9Hm+fthrWfwIyGoC5aEf7vd
PKkEDt4VZ9RbudZU/c3N8+kURaHNtrvu2K+mQs5w/AF7HYZThqmOzQJnvMRjuL8xggJtMIICaQIB
ATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhH
bG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwYjepatB64S625eswwDQYJ
YIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIFaQ8B4Pyu23CgqpAOijXboNYkC//JTVBX9y
VF0qU6taMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIyMDcyNzE2
NTczN1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFl
AwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATAN
BgkqhkiG9w0BAQEFAASCAQAMNY0tgXrlL86RsC75JP4HUk9TWn2J1A9M1SQATr5dJVclCN/T8DJE
8wP2UyB9/1rypmcoJMjcTDKbKMaW8/Gy5QAm2QZMBSIuMk9YvXD2YvhZUR3VVBzz6dCSsbBXdydH
Kke2O8Kep2ZwDIoLDaizZTzmp9cYpBzfPLV9JbEmvG6KTtGlmlDm/nQSYhPAUimgi+h0gQlWT+Pg
kdccV+tPBSXb8Au48+vlBNVA2aLpCrdFToBPSv8gmxxsPUYgql8DfZnecY/67FphOlvzxmUh9Svn
32DzXKfO44marBXS4ZMEAciKv8ilibKBGsGGl/lUKMUijXL49JKdeFTLmk3e
--0000000000007201ac05e4cc5066--
