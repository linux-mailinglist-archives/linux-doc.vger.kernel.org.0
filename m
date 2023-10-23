Return-Path: <linux-doc+bounces-864-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F917D4013
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 21:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64BB7281673
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 19:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98654224C8;
	Mon, 23 Oct 2023 19:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="VB+ocMv6"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62531CA8D
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 19:22:30 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2703AA9
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 12:22:27 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40859c464daso19480745e9.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 12:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1698088945; x=1698693745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m0mavyerLdt+O6sNoNRNG7UFPQ8QcrZGfQP3PBOJoHQ=;
        b=VB+ocMv6CTxSC2x/o++HXH8GJE/m4glV7R0jZOKJ/x+4iM4AbylGXD7lJL0MbppM0e
         0vpJBkYJSjCyQtglFCJGbYKKrkjH8ODDgTjn9OUcFwVjok4/EvzrYgjrQ+6sqMIOVhD7
         LOdp6mB9e9lzPTcOd4smMyfP7bkEPs+og1m9tpctm0Q6pU+t423fajmXy5NV2nh/zoOq
         SH2oQSLJrySfM4Nlh5UZv/4lSA+5jwYRBFmQQMIvsmQoL1YbGH7861xS1DProFoKWxkB
         fjGv1Zij+OtDsLDrkWeab166DAGbJNmSHIS2FMc92osTQdr8zhcM+jzV5rBwyRJ3atge
         OA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698088945; x=1698693745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0mavyerLdt+O6sNoNRNG7UFPQ8QcrZGfQP3PBOJoHQ=;
        b=Rhn9/SWbgo2lkwaf0KNGMzBAjlHN1cow7seTskCwZhBbzG3FLihOLDYIDoZL7JN9Zl
         sliHle4UmXoImDH8tDjBzR3lTUZxPoOaRg9u7bJqOkm7JEuohFJKMVN3YY/q1e8KAou4
         mrgtDIn5ZQb0mNDMaw9HHi1Cbf27QWvnh+vpT5K2b0Jo0Iyu9ATAA5Zq2oazlb5VqOF8
         M5oytUhdD1jkddy/+4Si2S7YlIiJSo/dCSQvotJF5eGE+SlQNbQm1nD1oXmjr36FWDS5
         yVoFdg4LDN3l0JlrnRWf0c7MyojBBArl4YzD7T+dOcQUHRZzoeXNk1vuZIMciWya6l4Z
         38Ow==
X-Gm-Message-State: AOJu0Yye4Urp7UCWUqKirEmHnoUsEwe9EVpmWV8P4NJhwQOxqoOSuXnY
	UdGA48yXoL9Sx3B5xxTPlOke4A==
X-Google-Smtp-Source: AGHT+IFr+o03bydJU8FzMZSrYg4fHBo6Cu7YvBwVZsTdjrWm9dXF0YqFkofzAoXIiBP5g8eGbBPukQ==
X-Received: by 2002:a05:600c:4690:b0:408:e441:1697 with SMTP id p16-20020a05600c469000b00408e4411697mr4091219wmo.39.1698088945472;
        Mon, 23 Oct 2023 12:22:25 -0700 (PDT)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id ay20-20020a05600c1e1400b00407460234f9sm10142088wmb.21.2023.10.23.12.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 12:22:24 -0700 (PDT)
From: Dmitry Safonov <dima@arista.com>
To: David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Safonov <dima@arista.com>,
	Andy Lutomirski <luto@amacapital.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Bob Gilligan <gilligan@arista.com>,
	Dan Carpenter <error27@gmail.com>,
	David Laight <David.Laight@aculab.com>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Donald Cassidy <dcassidy@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Francesco Ruggeri <fruggeri05@gmail.com>,
	"Gaillardetz, Dominik" <dgaillar@ciena.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	Ivan Delalande <colona@arista.com>,
	Leonard Crestez <cdleonard@gmail.com>,
	"Nassiri, Mohammad" <mnassiri@ciena.com>,
	Salam Noureddine <noureddine@arista.com>,
	Simon Horman <horms@kernel.org>,
	"Tetreault, Francois" <ftetreau@ciena.com>,
	netdev@vger.kernel.org,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH v16 net-next 00/23] net/tcp: Add TCP-AO support
Date: Mon, 23 Oct 2023 20:21:52 +0100
Message-ID: <20231023192217.426455-1-dima@arista.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This is version 16 of TCP-AO support. It addresses the build warning
in the middle of patch set, reported by kernel test robot.

There's one Sparse warning introduced by tcp_sigpool_start():
__cond_acquires() seems to currently being broken. I've described
the reasoning for it on v9 cover letter. Also, checkpatch.pl warnings
were addressed, but yet I've left the ones that are more personal
preferences (i.e. 80 columns limit). Please, ping me if you have
a strong feeling about one of them.

The following changes since commit d6e48462e88fe7efc78b455ecde5b0ca43ec50b7:

  net: mdio: xgene: Fix unused xgene_mdio_of_match warning for !CONFIG_OF (2023-10-23 10:16:47 -0700)

are available in the Git repository at:

  git@github.com:0x7f454c46/linux.git tcp-ao-v16

for you to fetch changes up to 4d4eb816c47537ba31912dd5c8d7a68a69694fc6:

  Documentation/tcp: Add TCP-AO documentation (2023-10-23 18:49:17 +0100)

----------------------------------------------------------------

And another branch with selftests, that will be sent later separately:

  git@github.com:0x7f454c46/linux.git tcp-ao-v16-with-selftests

Thanks for your time and reviews,
         Dmitry

--- Changelog ---

Changes from v15:
- Fix build warning on RST patch in tcp_ao_prepare_reset(), now 'else'
  is dropped. Added back by later patch that wires up reqsk.
  (kernel test robot <lkp@intel.com>)

Version 15: https://lore.kernel.org/all/20231018205806.322831-1-dima@arista.com/

Changes from v14:
- selftests: Refactored (enum test_fault) into tcp_ao selftest's lib/
- selftests: Refactored should_skip_test(), TEST_NEEDS_MD5,
  TEST_NEEDS_VRF, check_*_support() into lib/kconfig.c
- selftests: checked that tests are properly SKIPed when kernel config
  doesn't have required options enabled: net_ns, veth, tcp_ao and
  optionally tcp_md5, net_vrf
- Corrected Simon's email as his corigine address bounces back
- Fix missed ifdeffery for rcu_read_lock() in tcp_v6_send_reset()
  (kernel test robot <oliver.sang@intel.com>)
- Move tcp_key::sne after tcp_key::traffic_key to avoid a hole (Eric)
- In patch that wires up RST packets move TCPF_TIME_WAIT sk_state check
  to (TCPF_LISTEN | TCPF_NEW_SYN_RECV) checks in
  tcp_ao_prepare_reset(). (Eric)
- Converted tcp_ao_info::refcnt from atomic_t to refcount_t (Eric)
- Removed TODO comment in tcp_ao_connect_init(): can't happen because of
  the checks in tcp_connect(). Added WARN_ON_ONCE() if anything gets
  broken.

Version 14: https://lore.kernel.org/all/20231009230722.76268-1-dima@arista.com/T/#u

Changes from v13:
- Converted Documentation/ page from human unreadable list-table::
  to grid-table(s) (Jonathan)

Version 13: https://lore.kernel.org/all/20231004223629.166300-1-dima@arista.com/T/#u

Changes from v12:
- Separate TCP-AO sign from __tcp_transmit_skb() into a separate
  function for code locality and readability (Paolo)
- Add TCP-AO self-connect selftest, which by its nature is a selftest
  for TCP simultaneous open, use different keyids and check tcp repair
- Fix simultaneous open: take correct ISNs for verification,
  pre-calculate sending traffic key on SYN-ACK, calculate receiving
  traffic key before going into TCP_ESTABLISHED
- Use kfree_sensitive() for hardening purposes
- Use READ_ONCE() on sk->sk_family when not under socket lock to prevent
  any possible race with IPV6_ADDRFORM

Version 12: https://lore.kernel.org/all/20230918190027.613430-1-dima@arista.com/T/#u

Changes from v11:
- Define (struct tcp_key) for tcp-fast path and detect by type what key
  was used. This also benefits from TCP-MD5/TCP-AO static branches (Eric)
- Remove sk_gso_disable() from TCP-AO fast-path in __tcp_transmit_skb()
  (Eric)
- Don't leak skb on failed kmalloc() in __tcp_transmit_skb() (Eric)
- skb_dst_drop() is not necessary as kfree_skb() calls it (Eric)
- Don't dereference tcp_ao_key in net_warn_ratelimited(), outside of
  rcu_read_lock() (Eric)

Version 11: https://lore.kernel.org/all/20230911210346.301750-1-dima@arista.com/T/#u

Changes from v10:
- Make seq (u32) in tcp_ao_prepare_reset() and declare the argument
  in "net/tcp: Add TCP-AO SNE support", where it gets used (Simon)
- Fix rebase artifact in tcp_v6_reqsk_send_ack(), which adds
  compile-error on a patch in the middle of series (Simon)
- Another rebase artifact in tcp_v6_reqsk_send_ack() that makes
  keyid, requested by peer on ipv6 reqsk ACKs not respected (Simon)

Version 10: https://lore.kernel.org/all/20230815191455.1872316-1-dima@arista.com/T/#u

The pre-v10 changelog is on version 10 cover-letter.

Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Bob Gilligan <gilligan@arista.com>
Cc: Dan Carpenter <error27@gmail.com>
Cc: David Ahern <dsahern@kernel.org>
Cc: David Laight <David.Laight@aculab.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Dmitry Safonov <0x7f454c46@gmail.com>
Cc: Donald Cassidy <dcassidy@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Francesco Ruggeri <fruggeri05@gmail.com>
Cc: Gaillardetz, Dominik <dgaillar@ciena.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
Cc: Ivan Delalande <colona@arista.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Leonard Crestez <cdleonard@gmail.com>
Cc: Nassiri, Mohammad <mnassiri@ciena.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Salam Noureddine <noureddine@arista.com>
Cc: Simon Horman <horms@kernel.org>
Cc: Tetreault, Francois <ftetreau@ciena.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Dmitry Safonov (23):
  net/tcp: Prepare tcp_md5sig_pool for TCP-AO
  net/tcp: Add TCP-AO config and structures
  net/tcp: Introduce TCP_AO setsockopt()s
  net/tcp: Prevent TCP-MD5 with TCP-AO being set
  net/tcp: Calculate TCP-AO traffic keys
  net/tcp: Add TCP-AO sign to outgoing packets
  net/tcp: Add tcp_parse_auth_options()
  net/tcp: Add AO sign to RST packets
  net/tcp: Add TCP-AO sign to twsk
  net/tcp: Wire TCP-AO to request sockets
  net/tcp: Sign SYN-ACK segments with TCP-AO
  net/tcp: Verify inbound TCP-AO signed segments
  net/tcp: Add TCP-AO segments counters
  net/tcp: Add TCP-AO SNE support
  net/tcp: Add tcp_hash_fail() ratelimited logs
  net/tcp: Ignore specific ICMPs for TCP-AO connections
  net/tcp: Add option for TCP-AO to (not) hash header
  net/tcp: Add TCP-AO getsockopt()s
  net/tcp: Allow asynchronous delete for TCP-AO keys (MKTs)
  net/tcp: Add static_key for TCP-AO
  net/tcp: Wire up l3index to TCP-AO
  net/tcp: Add TCP_AO_REPAIR
  Documentation/tcp: Add TCP-AO documentation

 Documentation/networking/index.rst  |    1 +
 Documentation/networking/tcp_ao.rst |  444 +++++
 include/linux/sockptr.h             |   23 +
 include/linux/tcp.h                 |   30 +-
 include/net/dropreason-core.h       |   30 +
 include/net/tcp.h                   |  288 +++-
 include/net/tcp_ao.h                |  362 ++++
 include/uapi/linux/snmp.h           |    5 +
 include/uapi/linux/tcp.h            |  105 ++
 net/ipv4/Kconfig                    |   17 +
 net/ipv4/Makefile                   |    2 +
 net/ipv4/proc.c                     |    5 +
 net/ipv4/syncookies.c               |    4 +
 net/ipv4/tcp.c                      |  246 +--
 net/ipv4/tcp_ao.c                   | 2392 +++++++++++++++++++++++++++
 net/ipv4/tcp_input.c                |   98 +-
 net/ipv4/tcp_ipv4.c                 |  363 +++-
 net/ipv4/tcp_minisocks.c            |   50 +-
 net/ipv4/tcp_output.c               |  236 ++-
 net/ipv4/tcp_sigpool.c              |  358 ++++
 net/ipv6/Makefile                   |    1 +
 net/ipv6/syncookies.c               |    5 +
 net/ipv6/tcp_ao.c                   |  168 ++
 net/ipv6/tcp_ipv6.c                 |  376 +++--
 24 files changed, 5174 insertions(+), 435 deletions(-)
 create mode 100644 Documentation/networking/tcp_ao.rst
 create mode 100644 include/net/tcp_ao.h
 create mode 100644 net/ipv4/tcp_ao.c
 create mode 100644 net/ipv4/tcp_sigpool.c
 create mode 100644 net/ipv6/tcp_ao.c


base-commit: d6e48462e88fe7efc78b455ecde5b0ca43ec50b7
-- 
2.42.0


